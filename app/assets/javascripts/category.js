$(document).on('turbolinks:load', function(){
  $(function () {
    function buildoption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    function buildchidrenbox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class="item__post__container__third__categoryform" id="children_wrapper">
                          <div class="input__category1">
                            <select class="input__category" name="item[category_id]" id="child_category"><option value="選択してください">選択してください</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>`;
      $('.item__post__container__third__category').append(childSelectHtml);
    }
    function buildgrandchidrenbox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class="item__post__container__third__categoryform" id="grandchildren_wrapper">
                              <div class="input__category1">
                                <select class="input__category" name="item[category_id]" id="grandchild_category"><option value="選択してください">選択してください</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
      $('.item__post__container__third__category').append(grandchildSelectHtml);
    }
    $('#item_category').on('change', function () {
      var parent_name = $('#item_category').val();
      if (parent_name != "選択して下さい") {
        $.ajax({
          url: 'category_children',
          type: 'GET',
          data: { parent_name: parent_name },
          dataType: 'json'
        })
        .always(function(){
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
        })
        .done(function(children){
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += buildoption(child);
          });
          buildchidrenbox(insertHTML);
        })
        .fail(function(){
        })
      }else{
        
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
      }
    });
    $('.item__post__container__third__category').on('change', '#child_category', function () {
      var child_Id = $('#child_category option:selected').data('category');
      if (child_Id != "選択して下さい"){
        $.ajax({
          url: 'category_grandchildren',
          type: 'GET',
          data: { child_id: child_Id },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += buildoption(grandchild);
            });
            buildgrandchidrenbox(insertHTML);
          }
        })
        .fail(function(){
          alert('エラー');
        })
      }else{
        $('#grandchildren_wrapper').remove();
      }
    });
  });
});