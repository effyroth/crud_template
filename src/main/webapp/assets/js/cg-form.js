$(function() {

    var cgForm = $('.cg-form');
    cgForm.find('.save-btn').click(function(e) {
        var form = $(this).parents('form');

        var url = form.attr('action');
        var updateId = cgForm.find('#update-id').val();
        if(updateId!=""){
        	url = form.data('update');
        }
        
        var sendData  = cgForm.serialize();
        $.post(url, sendData, function(data) {
            if (data.status == "success") {
                if(updateId!=""){
            		$.each(getFormElements(),function (i,v) {
            			$('.cg-table tbody tr.update-this td.'+v).text(eval("data."+item+"."+v));
                    });
                    $('.cg-table tbody tr.update-this').removeClass("update-this");
                    $(".cg-form input[type='hidden']").val("");
                }else{
                    var nodeTr = $('.cg-table tbody tr').last().clone();
                    $.each(getFormElements(),function (i,v) {
                    	nodeTr.find("."+v).text(eval("data."+item+"."+v));
                    });
                    nodeTr.appendTo($('.cg-table tbody'));
                }
                
                resetForm(form);
            } else {
                alert(data.msg);
            }

        }, "json").error(function() {
            alert("network error, please check it.");
        });
    });

    function resetForm($form) {
    	$form[0].reset();
    }

    cgForm.find('.cancel-btn').click(function(e) {
    	form = $(this).parents('form');
    	resetForm(form);
    });
    var noticeModifyTable = $('.cg-table');
    
    noticeModifyTable.on('click','.modify', function(e){
        var content = $(this).parents('tr');
       
        $('#update-id').val($(this).parents('tr').find('.item-id').text());
        $.each(getFormElements(),function (i,v) {
        	var textNode = content.find('.'+v);
        	$('#'+v).val(textNode.text());
        });
        content.addClass('update-this');
    });
    noticeModifyTable.on('click', '.delete', function(e){
    	var deleteUrl = cgForm.data('delete');
        
        var nodeTr = $(this).parents('tr'),
            id = nodeTr.find('.item-id').text(),
            sendData = {"deleteId": id};
        $.post(deleteUrl, sendData, function(data){
            if(data.status == "success"){
                nodeTr.remove();
            }else{
                alert(data.msg);
            }
        },'json');
        
    });
    
    function getFormElements(){
    	var arr = new Array();
    	$(".cg-form input[type='text']").each(function (i) {
            arr[i] = $(this).attr("name");
        });
    	return arr;
    }
});