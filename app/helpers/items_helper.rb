module ItemsHelper
  def choose_confirm
    if action_name == 'confirm' 
      confirm_items_path
    end
  end
end
