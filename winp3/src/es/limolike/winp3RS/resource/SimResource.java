package es.limolike.winp3RS.resource;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import es.limolike.winp3.resource.Resource;
import es.limolike.winp3RS.domain.Simulator;

@Component
@Path("/simulator")
public class SimResource extends Resource implements ISimResource {

	@POST
	@Path("/upload")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces({ MediaType.APPLICATION_JSON})
	public Simulator upload(@Context HttpServletRequest request) {
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items = null;
		Simulator bean = null;
		
		
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		if (items != null) {
			Iterator<FileItem> iter = items.iterator();

			while (iter.hasNext()) {

				FileItem item = iter.next();
				if (item.isFormField()) continue;
				
				// If the current item is file data
				DocumentBuilder dBuilder;
				Document doc;
				try {
					dBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
					doc = dBuilder.parse(item.getInputStream());
					
					
					doc.getDocumentElement().normalize();

					System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
					
					
					
					JAXBContext jaxbContext = JAXBContext.newInstance(Simulator.class);

				      Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
				      bean = (Simulator) jaxbUnmarshaller.unmarshal(item.getInputStream());
				      System.out.println(bean.getName());
					
					
				} catch (ParserConfigurationException | SAXException | IOException | JAXBException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				

//				res = 0;
//
//				if (res == 1)
//					return new Respuesta("uploadWar", "ERROR", "Se ha producido un error en el servidor.");				
//				else if (res == 2)
//					return new Respuesta("uploadWar", "ERROR", "Fichero incorrecto. El fichero esperado es XML");
			}
		}
		//return Response.status(200).entity("OK").build(); 
		return bean;
	}
	
}
