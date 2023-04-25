package service;

import common.Validation;
import model.Person;
import repository.IPersonRepository;
import repository.PersonRepository;

import java.time.LocalDate;
import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PersonService implements IPersonService {
    private IPersonRepository iPersonRepository = new PersonRepository();

    @Override
    public List<Person> list() {
        return iPersonRepository.list();
    }

    @Override
    public List<Person> searchByName(String name) {
        return iPersonRepository.searchByName(name);
    }

    @Override
    public Person findById(int id) {
        return iPersonRepository.findById(id);
    }

    @Override
    public Map<String,String> save(Person person) {
        Map<String, String> map = new HashMap<>();
        if (person.getName().length() == 0) {
            map.put("empty_name", "Name can not be empty");
        } else if (!Validation.validateNameOrAddress(person.getName())) {
            map.put("invalid_name", "Invalid name format . (ex : Abc Abc).");
        }

        if (person.getAddress().length() == 0) {
            map.put("empty_address", "Address can not be empty.");
        }

        if (person.getEmail().length() == 0) {
            map.put("empty_email", "Email can not be empty.");
        } else if (!Validation.validateEmail(person.getEmail())) {
            map.put("invalid_email", "Invalid email format . (ex : abcabc@gmail.com).");
        } else if(checkEmailIsExist(person.getEmail())){
            map.put("exist_email","Email existed");
        }

        if (person.getDate().length() == 0) {
            map.put("empty_birthday", "Birthday can not be empty.");
        } else {
            if (!Validation.validateFormatDate(person.getDate())) {
                map.put("invalid_birthday", "Invalid birthday format . (ex : dd-mm-yyyy).");
            }else {
                String[] arr = person.getDate().split("-");
                String temp = arr[0];
                arr[0] = arr[2];
                arr[2] = temp;
                String date = arr[0] + "-" + arr[1] +"-"+arr[2];
                System.out.println(date);
                if(!Validation.validateDate(date)){
                    map.put("Error_date", "Error date");
                }else {
                    LocalDate localDate =  LocalDate.parse(date);
                    LocalDate localDate1 = LocalDate.now();
                    int year = Period.between(localDate,localDate1).getYears();
                    if(year < 18 || year > 80){
                        map.put("Error_age","Your age is not permitted");
                    }
                }
            }
        }


        if(map.isEmpty()){
            if(!iPersonRepository.save(person)){ //true => !true == false // false => !false == true
                map.put("error","Something wrong, try again");
            }
        }
        return map;
    }

    @Override
    public void remove(int id) {
        iPersonRepository.remove(id);
    }

    @Override
    public void update(Person person) {
        iPersonRepository.update(person);
    }

    @Override
    public boolean checkEmailIsExist(String string) {
        return iPersonRepository.checkEmailIsExist(string);
    }
}
