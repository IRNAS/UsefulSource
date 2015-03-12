Thingiverse.PendingUploadImage=function(opts){if(!opts||typeof opts!=='object'){opts={};}
this.uploading=false;this.settings=$.extend(true,{},this.defaultSettings,opts);this.init();return this;};Thingiverse.PendingUploadImage.prototype.defaultSettings={$input:null,$progress:null,$preview:null,$form:null,url:null,$hiddenField:null};Thingiverse.PendingUploadImage.prototype.init=function(){var self=this;if(!self.settings.$hiddenField){var hiddenName=self.settings.$input.attr('name')+'_pending_id';var $hiddenField=$('<input type="hidden" name="'+ hiddenName+'" value="">');self.settings.$form.append($hiddenField);self.settings.$hiddenField=$hiddenField;}
self.settings.$input.on('change',function(e){self.startUpload(this.files[0]);});};Thingiverse.PendingUploadImage.prototype.startUpload=function(file){var self=this;self.uploading=true;self.renderPreview(file);self.updateProgress(0);$.when(self.getUploadData(file)).done(function(pending_id){self.settings.$hiddenField.val(pending_id);self.uploading=false;$(document).trigger('PendingUploadImageComplete',self.settings.$hiddenField);}).fail(function(response){alert('There was a problem uploading your photo');});};Thingiverse.PendingUploadImage.prototype.renderPreview=function(file){var self=this;var reader=new FileReader();reader.onloadend=function(){self.settings.$preview.css('background-image','url('+ reader.result+')');}
if(file){reader.readAsDataURL(file);}else{self.settings.$preview.attr('src',reader.result);}};Thingiverse.PendingUploadImage.prototype.updateProgress=function(percentComplete){var self=this;self.settings.$progress.val(percentComplete);};Thingiverse.PendingUploadImage.prototype.getUploadData=function(file){var self=this;var deferred=new $.Deferred;$.ajax({url:self.settings.url,type:'POST',data:{name:file.name,size:file.size,type:file.type}}).done(function(data){$.when(self.uploadImage(data,file)).done(function(data){if(data){deferred.resolve(data);}}).fail(function(data){deferred.reject(data);});}).fail(function(data){deferred.reject(data);});return deferred.promise();};Thingiverse.PendingUploadImage.prototype.uploadImage=function(data,file){var self=this;var formData=new FormData();var deferred=new $.Deferred;var fields=data.fields;var pending_id=data.pending_upload_id;for(var field in fields){formData.append(field,fields[field]);}
formData.append('file',file);if(pending_id){function finalizeUpload(){self.updateProgress(100);deferred.resolve(pending_id);}
var xhr=new XMLHttpRequest();xhr.upload.addEventListener('progress',function(event){var percentComplete=-1;if(event.lengthComputable){percentComplete=Math.round(event.loaded*100/event.total);}
self.updateProgress(percentComplete);},false);xhr.addEventListener('load',function(){finalizeUpload();},false);xhr.addEventListener('error',function(){if(xhr.readyState==4&&xhr.status==0){finalizeUpload();}else{deferred.reject();}},false);xhr.addEventListener('abort',function(){deferred.reject();},false);xhr.open('POST','https://'+fields.bucket+'.s3.amazonaws.com/',true);xhr.send(formData);}else{deferred.reject();}
return deferred.promise();};