module CinnabarsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_cinnabars_path
    elsif action_name == 'edit'
      cinnabar_path
    end
  end
end
