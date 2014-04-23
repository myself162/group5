module GroupsHelper
  def render_post_content(post)
    simple_format(post.content)
  end


  def render_edit_post_button(group)
    if current_user && group.editable_by?(current_user) && current_user.is_member_of?(group)
      link_to("Edit", edit_group_path(group), :class => "btn btn-mini") 
    end 
  end

  def render_new_post_button(group)
    if current_user.try(:is_member_of?, group)
      link_to("New Post", new_group_post_path(group), :class => "btn btn-mini btn-primary")
    end
  end


end