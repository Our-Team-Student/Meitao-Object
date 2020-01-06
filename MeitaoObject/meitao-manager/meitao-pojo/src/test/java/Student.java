public class Student extends School {
    public static String name = "刘朝";

    static {
        System.out.println("静态代码块student");
    }

    public String age = "20student";

    {
        System.out.println("代码块student");
    }

    Student() {
        System.out.println("student无参构造器");
    }

    public void Show() {
    }

    public static void main(String[] args) {
        Student student = new Student();
    }
}
