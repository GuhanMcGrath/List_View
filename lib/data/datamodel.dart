class DataModel {
  String? doctors_id,
      doctors_user_id,
      doctors_name,
      doctor_clinic_name,
      doctors_email,
      doctors_contact_number,
      doctors_address,
      doctors_website,
      doctors_images,
      doctors_is_visit,
      doctor_specialist_id,
      doctors_week_days_opening_time,
      doctors_week_days_closing_time,
      doctors_week_ends_opening_time,
      doctors_week_ends_closing_time,
      doctors_is_available,
      doctors_status,
      doctors_description,
      doctor_latitude,
      doctor_longitude,
      doctor_business_id,
      created_date,
      modified_date,
      doctor_specialist_name;
  var doctor_schedule_details;

  DataModel(
      {this.doctors_id,
      this.doctors_user_id,
      this.doctors_name,
      this.doctor_clinic_name,
      this.doctors_email,
      this.doctors_contact_number,
      this.doctors_address,
      this.doctors_website,
      this.doctors_images,
      this.doctors_is_visit,
      this.doctor_specialist_id,
      this.doctors_week_days_opening_time,
      this.doctors_week_days_closing_time,
      this.doctors_week_ends_opening_time,
      this.doctors_week_ends_closing_time,
      this.doctors_is_available,
      this.doctors_status,
      this.doctors_description,
      this.doctor_latitude,
      this.doctor_longitude,
      this.doctor_business_id,
      this.created_date,
      this.modified_date,
      this.doctor_specialist_name,
      this.doctor_schedule_details});
}
