  FIELD dataset_file_obj LIKE gst_dataset_file.dataset_file_obj VALIDATE ~
  FIELD deployment_obj LIKE gst_dataset_file.deployment_obj VALIDATE ~
  FIELD deployment_description LIKE gst_deployment.deployment_description VALIDATE ~
  FIELD deploy_dataset_obj LIKE gst_dataset_file.deploy_dataset_obj VALIDATE ~
  FIELD owner_site_code LIKE gsc_deploy_dataset.owner_site_code VALIDATE ~
  FIELD ado_filename LIKE gst_dataset_file.ado_filename~
  FIELD loaded_date LIKE gst_dataset_file.loaded_date~
  FIELD loaded_time LIKE gst_dataset_file.loaded_time
