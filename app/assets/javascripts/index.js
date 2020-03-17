$(function () {
  
  $(".header__box__bottom__categorie__list").hover(
    function () {
      $(".category__parent").removeClass("none");
    }
  );

  $(".category_link").hover(function () {
    var parent_name = $(this).text();
    $.ajax({
      url: 'category_children_index',
      type: 'GET',
      data: { parent_name: parent_name },
      dataType: 'json'
    })

    .done(function(){  
    })  

  })
});


