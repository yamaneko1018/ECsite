module ItemsHelper
  def choose_confirm
    if action_name == 'update' 
      confirm_items_path
    end
  end
end
