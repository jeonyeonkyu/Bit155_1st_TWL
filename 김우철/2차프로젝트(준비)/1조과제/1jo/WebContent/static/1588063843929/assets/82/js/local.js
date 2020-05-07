jQuery(function($) {
	
	$.validator.addMethod('verifyPhoneNo', function(value, element) {
		var reg = /^([0-9]{9,11})$/;
		return (this.optional(element) || reg.test(value));
	});

	function toggleCheckboxGroup( selector, prop ) {
		$(selector).each(function(){
			$(this).iCheck(prop);				
		});
	}

	function toggleParentCheckbox( parent, totalChild, totalChecked ) {
		if (parent.data('check-rules') == 'any-children') {
			var checkStatus = (totalChecked > 0)? true:false;
			if(parent.prop('checked') != checkStatus)
				parent.iCheck(checkStatus? 'check':'uncheck');
		}

		if (parent.data('check-rules') == 'all-children') {
			var checkStatus = (totalChecked === totalChild)? 'check':'uncheck';
			parent.iCheck(checkStatus);
		}
	}

	// Check all toggle
	$('.checkall-toggle > .form-group > .checkbox input:checkbox').on('ifClicked', function(){						
		var children = $(this).data('child-selector');
		var checkStatus = !$(this).prop('checked')?'check':'uncheck';

		toggleCheckboxGroup( children, checkStatus );
	});

	function triggleParentCheckbox( self ) {
		var parents = self.parents('div.checkall-toggle').find('> .form-group > .checkbox input:checkbox');
		var parent = parents.eq(-2);
		var totalChild = parent.closest('div.checkall-toggle').find('.checkbox-list input:checkbox').length;
		var totalChecked = parent.closest('div.checkall-toggle').find('.checkbox-list input:checkbox').filter(':checked').length;

		if (parent.data('check-rules') == 'all-children') {
			var checkStatus = (totalChecked === totalChild)? true:false;
			var currentCheckStatus = parent.prop('checked');

			parent.iCheck(checkStatus? 'check':'uncheck');
		}

		if (parent.data('check-rules') == 'any-children') {
			var checkStatus = (totalChecked > 0)? true:false;
			var currentCheckStatus = parent.prop('checked');

			parent.iCheck(checkStatus? 'check':'uncheck');
		}

		if (parents.length > 2) {
			triggleParentCheckbox(parent);
		}
	}

	$('.checkbox-list input:checkbox[data-check-rules]').on('ifChanged', triggleParentCheckbox($(this)));

	$('.checkbox-list input:checkbox').not('input:checkbox[data-check-rules]').on('ifChanged', function(){
		var totalCount = $(this).closest('.checkbox-list').find('input:checkbox').length;
		var checkedCount = $(this).closest('.checkbox-list').find('input:checkbox').filter(':checked').length;
		var parent = $(this).closest('div.checkall-toggle').find('> .form-group > .checkbox input:checkbox');
		
		toggleParentCheckbox(parent, totalCount, checkedCount);
		triggleParentCheckbox($(this));
	});
	
});

