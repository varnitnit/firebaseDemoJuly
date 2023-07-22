class Notes{
 late int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Notes(this._title,this._date,this._priority,[this._description=""]);
  Notes.withId(this._id,this._title,this._date,this._priority,[this._description=""]);
}