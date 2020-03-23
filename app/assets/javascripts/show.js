$(document).on('turbolinks:load', function () {
  $(function() {
    $(".link_p").click(function () {
      $(".middle__bottom__ul__li__box__js").slideDown();
    })
    
    let tabs = $(".js__li");
    function tabSwitch() {
      $(".active").removeClass("active");
      $(this).addClass("active");
      const index = tabs.index(this);
      $(".li__bottom").removeClass("show").eq(index).addClass("show");
    }
    tabs.hover(tabSwitch);
  });
})

