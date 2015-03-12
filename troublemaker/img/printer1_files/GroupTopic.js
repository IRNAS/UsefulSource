Thingiverse.GroupTopic=function(opts){if(!opts||!opts.id){return false;}
this.id=opts.id;this.comment_id=opts.comment_id;this.$form=$('#topic-'+ this.id);this.$name=this.$form.find('input[name="name"]');this.$titleDisplay=this.$form.next('.topic-title');this.init();return this;};Thingiverse.GroupTopic.prototype.init=function(){var self=this;this.$form.on('submit',function(){return false;});$.Topic('commentEditFormLoaded'+ this.comment_id).subscribe(function(comment_id){self.showEdit(comment_id);});$.Topic('commentEdited'+ this.comment_id).subscribe(function(comment_id){self.edit(comment_id);});$.Topic('commentEditFormCancelled'+ this.comment_id).subscribe(function(comment_id){self.hideEdit(comment_id);});};Thingiverse.GroupTopic.prototype.showEdit=function(comment_id){this.$form.addClass('active');};Thingiverse.GroupTopic.prototype.hideEdit=function(comment_id){this.$form.removeClass('active');};Thingiverse.GroupTopic.prototype.edit=function(){var self=this;var name=this.$name.val();var error='There was a problem with your request.';$.ajax({url:'/ajax/grouptopics/edit',type:'POST',data:{id:this.id,name:name},dataType:'json'}).done(function(data,status,xhr){if(!data.ok){if(data.name&&data.name.error){error=data.name.error;}else if(data.error){error=data.error;}
alert(error);}else{self.updateName(name);}}).fail(function(xhr,status,error){alert(error);}).always(function(data,status,xhr){self.hideEdit();});};Thingiverse.GroupTopic.prototype.updateName=function(name){this.$titleDisplay.text(name);};