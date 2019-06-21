package ru.itis.drugstore.parsers;

public class Item {

    private String name;
    private String price;
    private String link;
    private String img;

    public Item(String name, String price, String link, String img) {
        this.name = name;
        this.price = price;
        this.link = link;
        this.img = img;
    }

    public Item(String name, String price, String link) {
        this.name = name;
        this.price = price;
        this.link = link;
    }

    @Override
    public String toString() {
        return "Parsers.Item{" +
                "name='" + name + '\'' +
                ", price='" + price + '\'' +
                ", link='" + link + '\'' +
                ", img='" + img + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
