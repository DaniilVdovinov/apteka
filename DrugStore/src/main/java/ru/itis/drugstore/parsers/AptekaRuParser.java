package ru.itis.drugstore.parsers;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import ru.itis.drugstore.models.Item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AptekaRuParser implements Parser {
    private Document doc;
    private String link = "https://apteka.ru/kazan/search/?q=";

    public List<Item> getItemsListByRequest(String request) {
        String newLink = link + request.replace(' ', '+');

        try {
            doc = Jsoup.connect(newLink).get();
        } catch (IOException e){
            throw new IllegalStateException(e);
        }

        List<Item> list = new ArrayList<Item>();

        Elements elements;
        try {
            elements = doc.getElementsByClass("items catalog-items js-products-container").get(0).getElementsByTag("article");
        } catch (IndexOutOfBoundsException e){
            return list;
        }

        for(Element element : elements){
            String name = element.attr("data-product-name");
            String price = element.attr("data-product-price");
            String href = "https://apteka.ru" + element.getElementsByTag("a").get(0).attr("href");
            String img = "https://apteka.ru" + element.getElementsByTag("img").get(0).attr("src");

            Item item = new Item(name.toUpperCase(), Double.parseDouble(price), href, img);
            list.add(item);
        }

        return list;

    }
}
