// To parse this JSON data, do
//
//     final sallary = sallaryFromJson(jsonString);

import 'dart:convert';

List<Sallary> sallaryFromJson(String str) => List<Sallary>.from(json.decode(str).map((x) => Sallary.fromJson(x)));

String sallaryToJson(List<Sallary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sallary {
    String idSallary;
    String nik;
    String nama;
    String periode;
    int basicSallary;
    int attendance;
    int overtime;
    int income;
    int tax;
    int loan;
    int deductions;
    int netIncome;

    Sallary({
        this.idSallary,
        this.nik,
        this.nama,
        this.periode,
        this.basicSallary,
        this.attendance,
        this.overtime,
        this.income,
        this.tax,
        this.loan,
        this.deductions,
        this.netIncome,
    });

    factory Sallary.fromJson(Map<String, dynamic> json) => Sallary(
        idSallary: json["id_sallary"],
        nik: json["nik"],
        nama: json["nama"],
        periode: json["periode"],
        basicSallary: json["basic_sallary"],
        attendance: json["attendance"],
        overtime: json["overtime"],
        income: json["income"],
        tax: json["tax"],
        loan: json["loan"],
        deductions: json["deductions"],
        netIncome: json["net_income"],
    );

    Map<String, dynamic> toJson() => {
        "id_sallary": idSallary,
        "nik": nik,
        "nama": nama,
        "periode": periode,
        "basic_sallary": basicSallary,
        "attendance": attendance,
        "overtime": overtime,
        "income": income,
        "tax": tax,
        "loan": loan,
        "deductions": deductions,
        "net_income": netIncome,
    };
}
