public class School {
    public static String name = "北大青鸟School";

    static {
        System.out.println("静态代码块School");
    }

    public String age = "20School";

    {
        System.out.println("代码块School");
    }

    public School() {
        System.out.println("School无参构造器");

    }
}
