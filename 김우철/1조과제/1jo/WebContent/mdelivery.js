/*$(function() {
		$("#form_login_masthead_rememberme").on("ifChecked", function(event){
			$("#rememberMe").modal("show");  			
		});
		$("#modal_login_rememberme").on("ifChecked", function(event){
			$("#rememberMe").modal("show");  			
		});
		$("#btnRememberMeCancel").click(function(){
			$("#rememberMe").modal("hide");
			$("#form_login_masthead_rememberme").iCheck("uncheck");
			$("#modal_login_rememberme").iCheck("uncheck");
			
			if (typeof rememberme_resetpassword !== 'undefined') {
				rememberme_resetpassword.iCheck('uncheck');
			}
		})
		$("#btnRememberMeAgree").click(function(){
			$("#rememberMe").modal("hide");
		})
		$(":button[class=close]").click(function(){
			$("#btnRememberMeCancel").click();
		})
	})
	
	$(function() {	
		 [/#page-content] 
		
		  $('#form_login_masthead').validate({
		      	rules: {
		      		userName: {
						required: true,
						email: true
					},
		
		    		password: {
						required: true
					}
		      	},
		    	messages: {
		    		userName: {
						required: '\uC774\uBA54\uC77C \uC8FC\uC18C\uB97C \uC785\uB825\uD558\uC154\uC57C \uB429\uB2C8\uB2E4.',
						email: '\uC798\uBABB\uB41C \uC774\uBA54\uC77C \uC8FC\uC18C\uC785\uB2C8\uB2E4.'
					},
		
		    		password: {
						required: '\uBE44\uBC00\uBC88\uD638\uB97C \uC785\uB825\uD558\uC154\uC57C \uB429\uB2C8\uB2E4'
					}
		    	},
		    	errorPlacement: function(error, element) {
					if (element.attr("name") == "userName" || element.attr("name") == "password" ) {
						$("#form_login_masthead ul").remove(); 
						$('#form_login_masthead_password').parents('.textfield-list-group').append(error);
					} else {
						 error.insertAfter(element);
					}
				}
	});
	 [/#page-content] 
	
             
       [#trackOrder.modal] 
 	        $('#form_trackOrder').validate({
	        	rules: {
	        		orderNum: {
	        			required: true,
	        			remote: {
	                    	param: {
	                    		url: '/kr/validate/trackOrder.json',
		                    	data: {
		                    		orderNumber: function() {
		                    			console.log('orderNumber : ', $('#form_trackOrder_orderNum').val());
		                    			return $('#form_trackOrder_orderNum').val();
		                    		}
		                    	},
		                    		method:"POST",
 	       							complete: function(xhr, status) {
 	       							var response = xhr.responseJSON;
               						if(response.valid==false)
               							{
    	                            $('#form_trackOrder .form-group .error')
    	                                .html(response.message);
               							}
          						 }
	                    	}
	        		}
	        	}
	        	},
	            messages: {
	                orderNum: {
	                    required : '\uC8FC\uBB38 \uBC88\uD638\uB97C \uC785\uB825\uD574 \uC8FC\uC2DC\uAE30 \uBC14\uB78D\uB2C8\uB2E4.'
	                }
	            }
	        });
		 [/#trackOrder.modal] 
		
  	$('#form_login_modal').validate({
		  		rules: {
			      		userName: {
						required: true,
						email: true
					},
		
		    		password: {
						required: true
					}
			      	},
		    	messages: {
		    		userName: {
						required: '\uC774\uBA54\uC77C \uC8FC\uC18C\uB97C \uC785\uB825\uD558\uC154\uC57C \uB429\uB2C8\uB2E4.',
						email: '\uC798\uBABB\uB41C \uC774\uBA54\uC77C \uC8FC\uC18C\uC785\uB2C8\uB2E4.'
					},
		
		    		password: {
						required: '\uBE44\uBC00\uBC88\uD638\uB97C \uC785\uB825\uD558\uC154\uC57C \uB429\uB2C8\uB2E4'
					}
		    	},
	    	errorPlacement: function(error, element) {
			    var ElementParent = element.parent();
			    if (element.attr("name") == "userName" || element.attr("name") == "password" ) {
			    	$('#form_login_modal_password').parents('.textfield-list-group').append(error);
			    	$("#form_login_masthead #errorId").remove();
			    } else {
			    	error.insertAfter(element);
			    }
			}
	    });  


	 [#signin-facebook.modal] 

    $(document).on('facebook.linkaccount.action.no', function(event) {
        setTimeout(function() {
            $('#signin-facebook').one('show.bs.modal', function() {
                $('#form_deliveryoptions_datetime_later').prop('checked', true);
            }).modal('show');
        }, 5);
        
    });




     [#signin-facebook-linkaccount.modal] 

    $(document).on('facebook.linkaccount.action.yes', function(event) {
        setTimeout(function() {
            $('#signin-facebook-linkaccount').one('show.bs.modal', function() {
                $('#form_deliveryoptions_datetime_later').prop('checked', true);
            }).modal('show');
        }, 5);
        
    });


    
    if (window.location.hash && window.location.hash == '#_=_') {
        window.location.hash = '';
    }

    
    $('#form_login_facebook_modal').validate({		
		rules : {
			contactNo: {
				required: true,
 				number: true,
 				verifyPhoneNo:true
			},
			email: {
				required: true,
				email: true,
				remote: {
                	param: {
                		url: '/kr/validate/validateFacebookEmail.json',
                    	data: {
	                    		emailString: function() {
	                    			console.log('email : ', $('#form_login_facebook_modal_username').val());
	                    			return $('#form_login_facebook_modal_username').val();
	                    		}
                    		},
                    		method:"POST",
       					complete: function(xhr, status) {
       							var response = xhr.responseJSON;
       							if(response.valid == false)
       							{
                            		$('#email .form-group .error').html(response.message);
       							}
  						 }
                	}
    			}
			}
		},
		messages: {	
			contactNo: {
				required: '\uC798\uBABB\uB41C \uD734\uB300\uC804\uD654 \uBC88\uD638\uC785\uB2C8\uB2E4.',
            	number : '\uD734\uB300\uC804\uD654 \uBC88\uD638 \uD615\uC2DD\uC774 \uC798\uBABB\uB418\uC5C8\uC2B5\uB2C8\uB2E4.',
            	verifyPhoneNo: '\uD734\uB300\uC804\uD654 \uBC88\uD638 \uD615\uC2DD\uC774 \uC798\uBABB\uB418\uC5C8\uC2B5\uB2C8\uB2E4.'
			},
			
			email: {
				required: '\uC798\uBABB\uB41C \uC774\uBA54\uC77C \uC8FC\uC18C\uC785\uB2C8\uB2E4.',
				email: '\uC774\uBA54\uC77C \uD615\uC2DD\uC774 \uC798\uBABB\uB418\uC5C8\uC2B5\uB2C8\uB2E4.',
				remote: "Email id already exists"
			},
			agreeTandC: {
				required: '*\uD544\uC218\uD56D\uBAA9\uC785\uB2C8\uB2E4.'
			},
			agreeUsePersonalInfo: {
				required: '\uAC1C\uC778\uC815\uBCF4\uC758 \uC218\uC9D1 \uBC0F \uC774\uC6A9\uC5D0 \uB3D9\uC758 \uD558\uC154\uC57C \uD569\uB2C8\uB2E4.'
			},
			passUserAge: {
				required: '*\uD544\uC218\uD56D\uBAA9\uC785\uB2C8\uB2E4.'
			},
			form_register_agreetnc: {
				required: '*\uD544\uC218\uD56D\uBAA9\uC785\uB2C8\uB2E4.'
			},
			form_register_agreeage: {
				required: '*\uD544\uC218\uD56D\uBAA9\uC785\uB2C8\uB2E4.'
			}
		},
		errorPlacement: function(error, element) {
			    var ElementParent = element.parent();
			    if (element.attr("name") == "email" || element.attr("name") == "contactNo" ) {
			    	$('#form_login_facebook_modal_username').parents('.textfield-list-group').append(error);
			    	$("#form_login_facebook_modal #errorId").remove();
			    } else {
			    	error.insertAfter(element);
			    }
			}
	});  

     [#form_login_facebook_modal.modal] 
 	$('#form_login_facebook_modal').on('click', '[type=\"submit\"]', function(event) {
		    event.preventDefault();
		    if ($('#form_login_facebook_modal').valid()) {
			    // Check that field is not empty
			    var email = $('#form_login_facebook_modal_username'); 
			    var contactNo = $('#form_login_facebook_modal_contactno');
			    var subscribe = $('#form_login_wechat_subscribe');
			    var emailVal = email.val(); 
				var contactNoVal = contactNo.val();
				var subscribeVal = subscribe.val();  
	
			    var error = contactNo.parent('div').parent('div').next('.error'); // error message element
			    var form = $(this).parents('form');
		        // If field is not empty, ajax validation
		        error.hide();
		        $.ajax('/kr/login/socialRegister.json', {
		            data: {
		                Email : emailVal,
		                ContactNo : contactNoVal,
		                SubscribeMailList : subscribeVal
		            },
		            method:"POST",
		            success: function(response, status, xhr) {
						// success, we can submit the form
	                    if(response.message=='success' && typeof(response.code)=='undefined'){
	                    	 console.log('success');
	                         $('#form_login_facebook_modal').hide();
	                          error.empty().hide();
	                          error.parents('.form-group').removeClass('form-group-error');
	                          window.location.replace(response.redirectUrl);
	                    }else{
	                    	 $('#form_login_facebook_modal').show();
	                            error.html(response.message).show();
	                            error.parents('.form-group').addClass('form-group-error');
	                    }
		            }
		        });
    		}
		});
     [/#form_login_facebook_modal.modal] 
    
	$('#form_fb_linkaccount_modal').validate({
    	rules: {
	  		email: {
				required: true, 
				email: true
			},
			password: {
				required: true
			}
	  	},
	  	messages: {
			email: {
				required: '\uC774\uBA54\uC77C \uC8FC\uC18C\uB97C \uC785\uB825\uD558\uC154\uC57C \uB429\uB2C8\uB2E4.',
				email: '\uC774\uBA54\uC77C \uD615\uC2DD\uC774 \uC798\uBABB\uB418\uC5C8\uC2B5\uB2C8\uB2E4.'
			},
			password: {
				required: '\uBE44\uBC00\uBC88\uD638\uB97C \uC785\uB825\uD558\uC154\uC57C \uB429\uB2C8\uB2E4'
			}
		},
        errorPlacement: function(error, element) {
            var ElementParent = element.parent();
            if (element.is(':checkbox')) {
                var controlGroup = element.parents('.checkbox');
                var label = controlGroup.find('.checkbox-label');
                label.append(error);
            } else if (element.attr("name") == "email" || element.attr("name") == "password") {
                $('#form_fb_linkaccount_modal_password').parents('.textfield-list-group').append(error);
            } else {
                error.insertAfter(element);
            }
        }
    });
     [/#signin-facebook-linkaccount.modal] 
	
     [#form_fb_linkaccount_modal.modal] 
 	$('#form_fb_linkaccount_modal').on('click', '[type=\"submit\"]', function(event) {
		    event.preventDefault();
		    if ($('#form_fb_linkaccount_modal').valid()) {
			    // Check that field is not empty
			    var email = $('#form_fb_linkaccount_modal_username'); 
			    var password = $('#form_fb_linkaccount_modal_password');
			    var emailVal = email.val(); 
				var passwordVal = password.val();
	
			    var error = email.parent('div').parent('div').next('.error'); // error message element
			    var form = $(this).parents('form');
		        // If field is not empty, ajax validation
		        error.hide();
		        $.ajax('/kr/login/socialLinkAccount.json', {
		            data: {
		                Email : emailVal,
		                Password : passwordVal
		            },
		            method:"POST",
		            success: function(response, status, xhr) {
						// success, we can submit the form
	                    if(response.message=='success' && typeof(response.code)=='undefined'){
	                    	 console.log('success');
	                         $('#form_fb_linkaccount_modal').hide();
	                          error.empty().hide();
	                          error.parents('.form-group').removeClass('form-group-error');
	                          window.location.replace(response.redirectUrl);
	                    }else{
	                    	 $('#form_fb_linkaccount_modal').show();
	                            error.html(response.message).show();
	                            error.parents('.form-group').addClass('form-group-error');
	                    }
		            }
		        });
    		}
		});
     [/#form_fb_linkaccount_modal.modal] 
    
    $('a').click(function(){
  		$('.modal').modal('hide')
	})
		 [/#signin.modal]   
  	if(null=="true"){
  		if (true) {
  			console.log('gtm_session_expired');
  			dataLayer.push({
  				'event':'trackEvent',
  				'vpv': 'vpv_session_expired_timer_popup',
  				'eventDetails.category':'error_popups',
  				'eventDetails.action':'inactive',
  				'eventDetails.label':'session_expired'
  			});
  		}
		$('#alertTimeOut').modal('show');
	}
    
  	if(null){
  		$(document).trigger('modal.trigger.guest.tab');
	}
    
  	$('.js-show-guest-order').on('click', function(e){
  	    e.preventDefault();
  	    $(document).trigger('modal.trigger.guest.tab');
  	});
  	
});*/