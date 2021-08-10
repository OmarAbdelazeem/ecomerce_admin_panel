    const functions = require("firebase-functions");
    const admin = require('firebase-admin');
 const algoliasearch = require('algoliasearch');

    const ALGOLIA_APP_ID = "D607WH5J8L";
    const ALGOLIA_ADMIN_KEY = "c077c6e2ee1957d990f76247f3088a8f";
    const ALGOLIA_CUSTOMERS_INDEX = "customers";
    const ALGOLIA_PRODUCTS_INDEX = "products";

    admin.initializeApp();



    const storage = admin.storage();






    //1) when admin create sub category
    exports.onCreateSubCategory = functions.firestore
        .document("/subCategories/{subCategoryId}")
        .onCreate(async (snapshot, context) => {

            const createdSubCategory = snapshot.data();

            const subCategoryId = context.params.subCategoryId;

            const mainCategoryId = createdSubCategory['main_category_id'];

            // add it to main category

            admin
                .firestore()
                .collection("mainCategories")
                .doc(mainCategoryId).update({
                    'sub_categories_ids': admin.firestore.FieldValue.arrayUnion(subCategoryId)
                });

        });

    //2) when admin update sub category
    exports.onUpdateSubCategory = functions.firestore.document("/subCategories/{subCategoryId}").onUpdate(async (change, context) => {

        const updatedSubCategoryData = change.after.data();

        const oldSubCategoryData = change.before.data();

        const productsRef =  admin.firestore().collection('products');

        // case of updating image
        // delete old image from storage

        var oldImage = oldSubCategoryData['image_id'];

          const bucket = storage.bucket();
          const path = "subCategories/" + oldImage;
          await bucket.file(path).delete();

          // case of updating name
        // update sub category name for related products
        const productsQuerySnapshot = await productsRef.where('sub_category', '==', oldSubCategoryData['name']).get();
        productsQuerySnapshot.forEach(doc => {

          productsRef.doc(doc.id).update({
            "sub_category": updatedSubCategoryData['name'],
            "categories": admin.firestore.FieldValue.arrayRemove(oldSubCategoryData['name']),
            "categories": admin.firestore.FieldValue.arrayUnion(updatedSubCategoryData['name']),
            })

        })

    })


    //3) when admin delete sub category
     exports.onDeleteSubCategory = functions.firestore.document("/subCategories/{subCategoryId}").onDelete(async (snapshot, context) => {

         const subCategoryData = snapshot.data();

         const imageId = subCategoryData['image_id'];

         console.log('image_id is ',imageId);



          // 1- delete sub category image from storage

          const bucket = storage.bucket();
          const path = "subCategories/" + imageId;
          await bucket.file(path).delete();


        // 2- delete sub category from products
        const productsRef =  admin.firestore().collection('products');
        const productsQuerySnapshot = await productsRef.where('sub_category', '==', subCategoryData['name']).get();
        productsQuerySnapshot.forEach( async doc => {

        await productsRef.doc(doc.id).update({
           'sub_category': {},
           'categories': admin.firestore.FieldValue.arrayRemove(subCategoryData['name'])
         })

       })

     })

    //4) when admin update main category
    exports.onUpdateMainCategory = functions.firestore.document("/mainCategories/{mainCategoryId}").onUpdate(async (change, context) => {

        const updatedMainCategoryData = change.after.data();

        const oldMainCategoryData = change.before.data();

        const mainCategoryId = context.params.mainCategoryId;

        //1- when admin change main category name

        /// change main category name for related products

        const productsRef =  admin.firestore().collection('products');
        const productsQuerySnapshot = await productsRef.where('categories', 'array-contains', oldMainCategoryData['name']).get();

        productsQuerySnapshot.forEach( async doc =>{
          await productsRef.doc(doc.id).update({
              'categories': FieldValue.arrayRemove(oldMainCategoryData['name']),
              'categories': admin.firestore.FieldValue.arrayUnion(updatedMainCategoryData['name'])
        })


        })

        //2- when admin remove subCategory
        /// delete them from subCategories collection

        const oldSubCategoriesIds = oldMainCategoryData['sub_categories_ids'];

        const updatedSubCategories = updatedMainCategoryData['sub_categories_ids'];


        let difference = oldSubCategoriesIds.filter(x => !updatedSubCategories.includes(x));

        difference.forEach(async id =>{
          await admin.firestore().collection('subCategories').doc(id).delete();

        })


    })


    // 5) when admin delete main category
    exports.onDeleteMainCategory = functions.firestore.document("/mainCategories/{mainCategoryId}").onDelete(async (snapshot, context) => {

        const mainCategoryData = snapshot.data();

        const subCategoriesIds = mainCategoryData['sub_categories_ids'];


        // delete category from products

        const productsRef = admin.firestore().collection('products');
        const productsQuerySnapshot = await productsRef.where('categories', 'array-contains', mainCategoryData['name']).get();

        productsQuerySnapshot.forEach(async doc =>{
           await productsRef.doc(doc.id).update({
              'categories': admin.firestore.FieldValue.arrayRemove(mainCategoryData['name'])
          })

        })


        // delete sub categories

        subCategoriesIds.forEach(async id =>{

         await admin.firestore().collection('subCategories').doc(id).delete();
        })

    })


    // 6) onCreate Product
    exports.onCreateProduct = functions.firestore
    .document('products/{productId}')
    .onCreate( async (snap, context) => {
        const productData = snap.data();

        //  add product data to algolia


        var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);
        var index = client.initIndex(ALGOLIA_PRODUCTS_INDEX);
        index.saveObject(productData);

    });


     // 7) onUpdate Product
     exports.onUpdateCustomer = functions.firestore
         .document('products/{productId}')
         .onUpdate( async (snap, context) => {
             const afterUpdate = snap.after.data();

               // 1 - update data to algolia 


             var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);
            
             var index = client.initIndex(ALGOLIA_PRODUCTS_INDEX);
             index.saveObject(afterUpdate);
         });
            

       // 8) onDelete Product
    exports.onDeleteProduct = functions.firestore.document("/products/{productId}").onDelete(async (snapshot, context) => {

        const productData = snapshot.data();

            // 1- delete product from algolia
            const oldID = snapshot.id;
            var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);
    
            var index = client.initIndex(ALGOLIA_PRODUCTS_INDEX);
            index.deleteObject(oldID);


       

        // 2- delete it's image from storage
        const imageId = productData['image_id'];
        const bucket = storage.bucket();
        const path = "products/" + imageId;
        return bucket.file(path).delete();

       

    })


// 9) onCreate Customer
 exports.onCreateCustomer = functions.firestore
     .document('customers/{customerId}')
     .onCreate( async (snap, context) => {
         const customerData = snap.data();
        const customerBasicInfo = {
            'objectID': customerData['id'],
            'name':customerData['name'],
            'phone_number':customerData['phone_number']
        }


         var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

         var index = client.initIndex(ALGOLIA_CUSTOMERS_INDEX);
         index.saveObject(customerBasicInfo);
     });


     // 10) onUpdate Customer
 exports.onUpdateCustomer = functions.firestore
     .document('customers/{customerId}')
     .onUpdate( async (snap, context) => {
         const afterUpdate = snap.after.data();

         const customerBasicInfo = {
            'objectID': afterUpdate['id'],
            'name':afterUpdate['name'],
            'phone_number':afterUpdate['phone_number']
        }
      
         var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

         var index = client.initIndex(ALGOLIA_CUSTOMERS_INDEX);
         index.saveObject(customerBasicInfo);
     });



     // 11) onDelete Customer
 exports.onDeleteCustomer = functions.firestore
     .document('customers/{customerId}')
     .onDelete( async (snap, context) => {
         const oldID = snap.id;
         var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

         var index = client.initIndex(ALGOLIA_CUSTOMERS_INDEX);
         index.deleteObject(oldID);
     });






