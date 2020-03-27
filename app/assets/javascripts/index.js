// $(function () {
//   function buildChildHTML(child){
//     var html =`<li class="category__children__li">
//                 <a class="children_link" id="${child.id}" href="#">${child.name}</a>
//               </li>`;
//     return html;
//   }
//   function buildGrandChildHTML(child){
//     var html =`<li class="category__parent__li">
//                 <a class="grandchildren_link" id="${child.id}" href="#">${child.name}</a>
//               </li>`;
//     return html;
//   }


  
//   $(".header__box__bottom__categorie__list__left").hover(
//       function () {
//       $(".category__parent").removeClass("none");
//     },
//     $(".category_link").hover(function () {
//       var parent_name = $(this).name
//       $.ajax({
//         url: '/items',
//         type: 'GET',
//         data: {parent_name: parent_name},
//         dataType: 'json'
//       }).done(function(children) {
//         children.forEach(function (child) {
//           var html = buildChildHTML(child);
//           $(".category__children__ul").append(html);   
//         })
//       },function () {
//         $(".category__parent").hover(function () {
//           $(".category__parent").addClass("none");
//           $(".category__children").addClass("none");
//         })
//       });
//     })
//   );



  // function () {
  //   $(".category__parent").addClass("none");    
  // }

  

  // $(document).on("mouseover", ".children_link", function () {
  //   console.log("ok")
  //   var children_name = $(this).name
  //   $.ajax({
  //     url: '/items',
  //     type: 'GET',
  //     data: {parent_name: children_name},
  //     dataType: 'json'
  //   }).done(function(children) {
  //     children.forEach(function (child) {
  //       var html = buildGrandChildHTML(child);
  //       $(".category__grandchildren__ul").append(html);
  //     })
  //   });
  // })
// });