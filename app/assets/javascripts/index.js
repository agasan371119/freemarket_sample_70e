$(function () {

  

  $(".header__box__bottom__categorie__list").hover(
    function () {
      $(".category__parent").removeClass("none");
    }
  );

  $(".category_link").hover(function () {
    var parent_name = $(this).value();
    console.log(parent_name)
    
    $.ajax({
      url: 'category_children_index',
      type: 'GET',
      data: { parent_name: parent_name },
      dataType: 'json'
    })


  })
});