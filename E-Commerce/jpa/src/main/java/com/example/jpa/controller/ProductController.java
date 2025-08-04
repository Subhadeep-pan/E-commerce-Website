package com.example.jpa.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.jpa.dao.ProductDao;
import com.example.jpa.model.Product;

@Controller
public class ProductController {
@Autowired
ProductDao pd;
private static final String UPLOAD_DIR = "uploads/";
@PostMapping("/additem")
public String addProd(@RequestParam("prodid")String id, @RequestParam("prodname")String name,
		@RequestParam("category")String catagory,@RequestParam("qty")String quantity,
		@RequestParam("price")String price,ModelMap model,@RequestParam("file") MultipartFile file)
{
	Product prod=new Product();
	prod.setId(id);
	prod.setName(name);
	prod.setCatagory(catagory);
	prod.setQuantity(Integer.parseInt(quantity));
	prod.setPrice(Double.parseDouble(price));
	
	// Handle file upload
    if (!file.isEmpty()) {
        try {
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String originalFileName = Paths.get(file.getOriginalFilename()).getFileName().toString();
            Path destinationPath = Paths.get(UPLOAD_DIR).resolve(originalFileName).normalize().toAbsolutePath();
            Files.copy(file.getInputStream(), destinationPath, StandardCopyOption.REPLACE_EXISTING);

            prod.setFileName(originalFileName);
            prod.setFilePath("/uploads/" + originalFileName);  // relative web path for image src

        } catch (IOException e) {
            e.printStackTrace();
            model.put("msg", "File upload failed!");
            return "error";
        }
    }
	
	pd.save(prod);
	model.put("msg", "Added!");
	return "addForm";
}
@GetMapping("/viewitem")
public String getAllData(Model model)
{
	List<Product> prod=pd.findAll();
	
	model.addAttribute("data",prod);
	return "dashboard";
}

@RequestMapping("/delete/{id}")
public String deleteProd(@PathVariable String id)
{
	pd.deleteById(id);
	return "redirect:/viewitem";
}
@RequestMapping("/viewrecord/{id}")
public String getSingleData(@PathVariable String id,Model model)
{
	Product prod=pd.findById(id).get();
	model.addAttribute("data",prod);
	return "updateForm";
}

@PostMapping("/update")
public String updateRecord(@RequestParam("prodid")String id, @RequestParam("prodname")String name,
		@RequestParam("catagory")String catagory,@RequestParam("qty")String quantity,
		@RequestParam("price")String price,@RequestParam(value = "file", required = false) MultipartFile file)


{
	//System.out.println("Hello........."+name);
	Product prod=new Product();
	prod.setId(id);
	prod.setName(name);
	prod.setCatagory(catagory);
	prod.setQuantity(Integer.parseInt(quantity));
	prod.setPrice(Double.parseDouble(price));
	//Handle new file upload during update
    if (file != null && !file.isEmpty()) {
        Product existing = pd.findById(id).orElse(null);
        
        try {
            // Delete old image from the upload folder
            if (existing != null && existing.getFileName() != null) {
                File oldFile = new File(UPLOAD_DIR + File.separator + existing.getFileName());
                if (oldFile.exists()) {
                    oldFile.delete();
                }
            }

            // Save new image
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String originalFileName = Paths.get(file.getOriginalFilename()).getFileName().toString();
            Path destinationPath = Paths.get(UPLOAD_DIR).resolve(originalFileName).normalize().toAbsolutePath();
            Files.copy(file.getInputStream(), destinationPath, StandardCopyOption.REPLACE_EXISTING);

            prod.setFileName(originalFileName);
            prod.setFilePath("/uploads/" + originalFileName);
        } catch (IOException e) {
            e.printStackTrace();
            return "error";
        }
    } else {
        // Optional: retain existing file info if no new file is uploaded
        Product existing = pd.findById(id).orElse(null);
        if (existing != null) {
            prod.setFileName(existing.getFileName());
            prod.setFilePath(existing.getFilePath());
        }
    }
	pd.save(prod);
	return "redirect:/viewitem";
}

@GetMapping("/mens")
public String getAllMensItem(Model model)
{
	List<Product> prod=(List<Product>) pd.findByCatagory("mcollection");
	model.addAttribute("product",prod);
	return "mens";
}

@GetMapping("/womens")
public String getAllWomensItem(Model model)
{
	List<Product> prod=(List<Product>) pd.findByCatagory("wcollection");
	model.addAttribute("product",prod);
	return "womens";
}
@GetMapping("/kids")
public String getAllkidsItem(Model model)
{
	List<Product> prod=(List<Product>) pd.findByCatagory("kcollection");
	model.addAttribute("product",prod);
	return "womens";
}
@GetMapping("/access")
public String getAllextraItem(Model model)
{
	List<Product> prod=(List<Product>) pd.findByCatagory("acollection");
	model.addAttribute("product",prod);
	return "womens";
}
}
