resource "google_pubsub_topic" "topic" {
  project                    = var.project_id
  kms_key_name               = var.kms_key_name
  name                       = var.topic_name
  message_retention_duration = var.topic_message_retention_duration
  # dynamic "schema_settings" {
  #   for_each = var.schema_settings ? [{}] : []
  #   content {
  #     schema   = google_pubsub_schema.schema.id
  #     encoding = var.encoding
  #   }
  # }

  dynamic "message_storage_policy" {
    for_each = var.message_storage_policy ? [{}] : []
    content {
      allowed_persistence_regions = var.allowed_persistence_regions
    }
  }
}

