/**
 * Credits:
 * David Sommer @ https://gist.github.com/davidsommer/7805574
 * Alan Williamson @ http://apache-poi.1045710.n5.nabble.com/Adding-Deleting-a-Column-td2309908.html
 */

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;

import java.io.*;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Parser {
    private static String file1Path = "HealthTalks- recetividade [FB] (Respostas).xlsx";
    private static String file2Path = "HealthTalks- recetividade [SI] (Respostas).xlsx";
    private static String concatPath = "Result.xlsx";

    public static void main(String[] args) throws IOException, InvalidFormatException {
        File mergedDoc = new File(concatPath);
        FileInputStream doc1 = new FileInputStream(file1Path);
        FileInputStream doc2 = new FileInputStream(file2Path);
        List<FileInputStream> docsList = Arrays.asList(doc1, doc2);
        mergeExcelFiles(mergedDoc, docsList);

        Workbook wb = WorkbookFactory.create(new File(concatPath));
        Sheet toAnalyse = wb.getSheetAt(0);
        //deleteColumn(toAnalyse, 26);
        //splitDateColumn(toAnalyse);
        createnewFile(toAnalyse);
    }

    private static void mergeExcelFiles(File file, List<FileInputStream> list) throws IOException {
        XSSFWorkbook book = new XSSFWorkbook();
        XSSFSheet sheet = book.createSheet(file.getName());

        for (FileInputStream fin : list) {
            XSSFWorkbook b = new XSSFWorkbook(fin);
            for (int i = 0; i < b.getNumberOfSheets(); i++) {
                copySheets(book, sheet, b.getSheetAt(i));
            }
        }

        try {
            writeFile(book, file);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private static void writeFile(XSSFWorkbook book, File file) throws Exception {
        FileOutputStream out = new FileOutputStream(file);
        book.write(out);
        out.close();
    }

    private static void copySheets(XSSFWorkbook newWorkbook, XSSFSheet newSheet, XSSFSheet sheet) {
        copySheets(newWorkbook, newSheet, sheet, true);
    }

    private static void copySheets(XSSFWorkbook newWorkbook, XSSFSheet newSheet, XSSFSheet sheet, boolean copyStyle) {
        int newRownumber = newSheet.getLastRowNum() + 1;
        int maxColumnNum = 0;
        Map<Integer, XSSFCellStyle> styleMap = (copyStyle) ? new HashMap<Integer, XSSFCellStyle>() : null;

        for (int i = sheet.getFirstRowNum(); i <= sheet.getLastRowNum(); i++) {
            XSSFRow srcRow = sheet.getRow(i);
            XSSFRow destRow = newSheet.createRow(i + newRownumber);
            if (srcRow != null) {
                copyRow(newWorkbook, sheet, newSheet, srcRow, destRow, styleMap);
                if (srcRow.getLastCellNum() > maxColumnNum) {
                    maxColumnNum = srcRow.getLastCellNum();
                }
            }
        }
        for (int i = 0; i <= maxColumnNum; i++) {
            newSheet.setColumnWidth(i, sheet.getColumnWidth(i));
        }
    }

    private static void copyRow(XSSFWorkbook newWorkbook, XSSFSheet srcSheet, XSSFSheet destSheet, XSSFRow srcRow, XSSFRow destRow, Map<Integer, XSSFCellStyle> styleMap) {
        destRow.setHeight(srcRow.getHeight());
        for (int j = srcRow.getFirstCellNum(); j <= srcRow.getLastCellNum(); j++) {
            XSSFCell oldCell = srcRow.getCell(j);
            XSSFCell newCell = destRow.getCell(j);
            if (oldCell != null) {
                if (newCell == null) {
                    newCell = destRow.createCell(j);
                }
                copyCell(newWorkbook, oldCell, newCell, styleMap);
            }
        }
    }

    private static void copyCell(XSSFWorkbook newWorkbook, XSSFCell oldCell, XSSFCell newCell, Map<Integer, XSSFCellStyle> styleMap) {
        if (styleMap != null) {
            int stHashCode = oldCell.getCellStyle().hashCode();
            XSSFCellStyle newCellStyle = styleMap.get(stHashCode);
            if (newCellStyle == null) {
                newCellStyle = newWorkbook.createCellStyle();
                newCellStyle.cloneStyleFrom(oldCell.getCellStyle());
                styleMap.put(stHashCode, newCellStyle);
            }
            newCell.setCellStyle(newCellStyle);
        }
        switch (oldCell.getCellType()) {
            case XSSFCell.CELL_TYPE_STRING:
                newCell.setCellValue(oldCell.getRichStringCellValue());
                break;
            case XSSFCell.CELL_TYPE_NUMERIC:
                newCell.setCellValue(oldCell.getNumericCellValue());
                break;
            case XSSFCell.CELL_TYPE_BLANK:
                newCell.setCellType(XSSFCell.CELL_TYPE_BLANK);
                break;
            case XSSFCell.CELL_TYPE_BOOLEAN:
                newCell.setCellValue(oldCell.getBooleanCellValue());
                break;
            case XSSFCell.CELL_TYPE_ERROR:
                newCell.setCellErrorValue(oldCell.getErrorCellValue());
                break;
            case XSSFCell.CELL_TYPE_FORMULA:
                newCell.setCellFormula(oldCell.getCellFormula());
                break;
            default:
                break;
        }
    }

    private static void deleteColumn(Sheet sheet, int columnToDelete) throws IOException, InvalidFormatException {
        int maxColumn = 0;
        for (int r = 0; r < sheet.getLastRowNum() + 1; r++) {
            Row row = sheet.getRow(r);

            // if no row exists here; then nothing to do; next!
            if (row == null)
                continue;

            // if the row doesn't have this many columns then we are good; next!
            int lastColumn = row.getLastCellNum();
            if (lastColumn > maxColumn)
                maxColumn = lastColumn;

            if (lastColumn < columnToDelete)
                continue;

            Cell cellToDelete = row.getCell(columnToDelete);
            if(cellToDelete != null)
                row.removeCell(row.getCell(columnToDelete));

            Workbook wb = WorkbookFactory.create(new File(concatPath));
            FileOutputStream fileOut = new FileOutputStream("truncated.xlsx");
            wb.write(fileOut);
            fileOut.close();
        }
    }

    private static void splitDateColumn(Sheet sheet) {
        for(int i = 2; i < sheet.getPhysicalNumberOfRows(); i++)
        {
            DataFormatter formatter = new DataFormatter();
            Cell cell = sheet.getRow(i).getCell(0);
            String contents = formatter.formatCellValue(cell);
            String[] items = contents.split(" ");

            for (String item : items) {
                System.out.println("Found csv item: " + item);
            }

        }
    }

    private static void createnewFile(Sheet oldSheet) throws IOException {
        String filename = "Attempt.xlsx" ;
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("FirstSheet");

        XSSFRow rowhead = sheet.createRow((short)0);
        rowhead.createCell(0).setCellValue("Date");
        rowhead.createCell(1).setCellValue("Time");
        rowhead.createCell(2).setCellValue("Gender");
        rowhead.createCell(3).setCellValue("Age");
        rowhead.createCell(4).setCellValue("Qualifications");
        rowhead.createCell(5).setCellValue("Do you usually take notes of health information?");
        rowhead.createCell(6).setCellValue("I take notes of my own health information");
        rowhead.createCell(7).setCellValue("I take notes of a family member's health information");
        rowhead.createCell(8).setCellValue("I take notes of a friend's health information");
        rowhead.createCell(9).setCellValue("I take notes of someone else's health information");
        rowhead.createCell(10).setCellValue("I write down weight");
        rowhead.createCell(11).setCellValue("I write down calories");
        rowhead.createCell(12).setCellValue("I write down heart rate");
        rowhead.createCell(13).setCellValue("I write down blood pressure");
        rowhead.createCell(14).setCellValue("I write down symptoms");
        rowhead.createCell(15).setCellValue("I write down the names of my illnesses");
        rowhead.createCell(16).setCellValue("I write down topics I want to discuss in a consultation");
        rowhead.createCell(17).setCellValue("I write down information I found online");
        rowhead.createCell(18).setCellValue("I write down analysis results");
        rowhead.createCell(19).setCellValue("I write down other information");
        rowhead.createCell(20).setCellValue("I take notes on paper");
        rowhead.createCell(21).setCellValue("I take notes on health books");
        rowhead.createCell(22).setCellValue("I take notes on note-taking apps");
        rowhead.createCell(23).setCellValue("I take notes on specialised apps");
        rowhead.createCell(24).setCellValue("I take notes on other places");
        rowhead.createCell(25).setCellValue("How often do you forget something a doctor said?");
        rowhead.createCell(26).setCellValue("How often does a doctor give you notes?");
        rowhead.createCell(27).setCellValue("Do you take notes of a consultation's contents?");
        rowhead.createCell(28).setCellValue("When do you take notes of a consultation?");
        rowhead.createCell(29).setCellValue("I register names of diseases");
        rowhead.createCell(30).setCellValue("I register medical opinions");
        rowhead.createCell(31).setCellValue("I register prescribed medication");
        rowhead.createCell(32).setCellValue("I register prescribed treatment");
        rowhead.createCell(33).setCellValue("I register medication dosages");
        rowhead.createCell(34).setCellValue("I register other information");
        rowhead.createCell(35).setCellValue("Do you understand everything doctors say?");
        rowhead.createCell(36).setCellValue("I don't understand because of their pronunciation");
        rowhead.createCell(37).setCellValue("I don't understand because of their voice volume");
        rowhead.createCell(38).setCellValue("I don't understand because of their attitude");
        rowhead.createCell(39).setCellValue("I don't understand because of the use of technical terms");
        rowhead.createCell(40).setCellValue("I don't understand because of the use of 'expensive' words");
        rowhead.createCell(41).setCellValue("I don't understand because of the ordering of ideas");
        rowhead.createCell(42).setCellValue("I don't understand because of their lack of time");
        rowhead.createCell(43).setCellValue("I don't understand because of some other reason");
        rowhead.createCell(44).setCellValue("Do you ask your doctor to repeat?");
        rowhead.createCell(45).setCellValue("I feel lack of confidence");
        rowhead.createCell(46).setCellValue("I feel like I would look like an ignorant");
        rowhead.createCell(47).setCellValue("I feel like I would be a bother");
        rowhead.createCell(48).setCellValue("I feel like someone will explain me later");
        rowhead.createCell(49).setCellValue("I feel like I trust my doctor");
        rowhead.createCell(50).setCellValue("I feel like I don't have enough time");
        rowhead.createCell(51).setCellValue("I feel uninterested");
        rowhead.createCell(52).setCellValue("I feel something else");
        rowhead.createCell(53).setCellValue("Do you have a mobile device?");
        rowhead.createCell(54).setCellValue("I use it for calls and texts");
        rowhead.createCell(55).setCellValue("I use it for Internet access");
        rowhead.createCell(56).setCellValue("I use it for native apps");
        rowhead.createCell(57).setCellValue("I use it for installed apps");
        rowhead.createCell(58).setCellValue("I use it for something else");
        rowhead.createCell(59).setCellValue("What's your operating system?");
        rowhead.createCell(60).setCellValue("Importance of recording doctor's voice");
        rowhead.createCell(61).setCellValue("Importance of transcribing a consultation");
        rowhead.createCell(62).setCellValue("Importance of definitions");
        rowhead.createCell(63).setCellValue("Importance of notes and management");
        rowhead.createCell(64).setCellValue("Would you use the app?");

        //for each row, according to its contents, make formatted rows in the new file
        for(int i = 2; i < oldSheet.getPhysicalNumberOfRows(); i++)
        {
            DataFormatter formatter = new DataFormatter();
            XSSFRow row = sheet.createRow((short)i-1);
            int currentColumn = 0;
            boolean takesHealthNotes = false;
            boolean takesNotesOfConsultation = false;
            boolean doesNotUnderstandsDoctors = false;
            boolean doesNotAskToRepeat = false;
            boolean hasMobileDevice = false;

            for(int j = 0; j <= oldSheet.getRow(i).getLastCellNum(); j++)
            {
                Cell cell = oldSheet.getRow(i).getCell(j);
                String contents = formatter.formatCellValue(cell);

                //date and time
                if(j==0)
                {
                    String[] items = contents.split(" ");
                    if(items.length == 2)
                    {
                        row.createCell(currentColumn).setCellValue(items[0]);
                        currentColumn++;
                        row.createCell(currentColumn).setCellValue(items[1]);
                    }
                }
                //gender
                else if(j==1)
                {
                    if(contents.equals("Masculino"))
                    {
                        row.createCell(currentColumn).setCellValue(0);
                    }
                    else if(contents.equals("Feminino"))
                    {
                        row.createCell(currentColumn).setCellValue(1);
                    }
                    else if(!contents.isEmpty()) //if it is empty, answer is not valid
                    {
                        row.createCell(currentColumn).setCellValue(2);
                    }
                }
                //age
                else if(j==2)
                {
                    switch (contents) {
                        case "18-25 anos":
                            row.createCell(currentColumn).setCellValue(18);
                            break;
                        case "26-35 anos":
                            row.createCell(currentColumn).setCellValue(26);
                            break;
                        case "36-49 anos":
                            row.createCell(currentColumn).setCellValue(36);
                            break;
                        case "50-64 anos":
                            row.createCell(currentColumn).setCellValue(50);
                            break;
                        case "65+ anos":
                            row.createCell(currentColumn).setCellValue(65);
                            break;
                    }
                }
                //qualifications
                else if(j==3)
                {
                    switch (contents) {
                        case "Não completei a 4.ª classe":
                            row.createCell(currentColumn).setCellValue(0);
                            break;
                        case "4.ª classe":
                            row.createCell(currentColumn).setCellValue(4);
                            break;
                        case "9.º ano":
                            row.createCell(currentColumn).setCellValue(9);
                            break;
                        case "12.º ano":
                            row.createCell(currentColumn).setCellValue(12);
                            break;
                        case "Licenciatura ou bacharelato":
                            row.createCell(currentColumn).setCellValue(15);
                            break;
                        case "Mestrado":
                            row.createCell(currentColumn).setCellValue(17);
                            break;
                        case "Doutoramento":
                            row.createCell(currentColumn).setCellValue(20);
                            break;
                    }
                }
                //do you take notes?
                else if(j==4)
                {
                    switch (contents) {
                        case "Sim":
                            row.createCell(currentColumn).setCellValue(1);
                            takesHealthNotes = true;
                            break;
                        case "Não":
                            row.createCell(currentColumn).setCellValue(0);
                            break;
                    }
                }
                //about whom?
                else if(j==5)
                {
                    if(takesHealthNotes)
                    {
                        String[] items = contents.split(", ");
                        row.createCell(currentColumn).setCellValue(0);
                        row.createCell(currentColumn+1).setCellValue(0);
                        row.createCell(currentColumn+2).setCellValue(0);
                        row.createCell(currentColumn+3).setCellValue(0);
                        for(String item : items)
                        {
                            switch (item) {
                                case "Sobre si próprio(a)":
                                    row.createCell(currentColumn).setCellValue(1);
                                    break;
                                case "Sobre um familiar":
                                    row.createCell(currentColumn + 1).setCellValue(1);
                                    break;
                                case "Sobre um(a) amigo(a)":
                                    row.createCell(currentColumn + 2).setCellValue(1);
                                    break;
                                default:
                                    row.createCell(currentColumn + 3).setCellValue(1);
                                    break;
                            }
                        }
                    }
                    currentColumn+=3;
                }
                //what info?
                else if(j==6) {
                    if (takesHealthNotes) {
                        String[] items = contents.split(", ");
                        row.createCell(currentColumn).setCellValue(0);
                        row.createCell(currentColumn+1).setCellValue(0);
                        row.createCell(currentColumn+2).setCellValue(0);
                        row.createCell(currentColumn+3).setCellValue(0);
                        row.createCell(currentColumn+4).setCellValue(0);
                        row.createCell(currentColumn+5).setCellValue(0);
                        row.createCell(currentColumn+6).setCellValue(0);
                        row.createCell(currentColumn+7).setCellValue(0);
                        row.createCell(currentColumn+8).setCellValue(0);
                        row.createCell(currentColumn+9).setCellValue(0);

                        for(String item : items)
                        {
                            switch (item) {
                                case "Peso":
                                    row.createCell(currentColumn).setCellValue(1);
                                    break;
                                case "Calorias ingeridas e/ou despendidas":
                                    row.createCell(currentColumn + 1).setCellValue(1);
                                    break;
                                case "Batimentos cardíacos ou pulso":
                                    row.createCell(currentColumn + 2).setCellValue(1);
                                    break;
                                case "Tensão arterial":
                                    row.createCell(currentColumn + 3).setCellValue(1);
                                    break;
                                case "Sintomas ou sinais clínicos":
                                    row.createCell(currentColumn + 4).setCellValue(1);
                                    break;
                                case "Nome da(s) doença(s) que tem":
                                    row.createCell(currentColumn + 5).setCellValue(1);
                                    break;
                                case "Pontos a discutir numa consulta futura":
                                    row.createCell(currentColumn + 6).setCellValue(1);
                                    break;
                                case "Informações encontradas na Web":
                                    row.createCell(currentColumn + 7).setCellValue(1);
                                    break;
                                case "Resultados de exames ou análises (exemplo: picar o dedo para saber o açúcar no sangue)":
                                    row.createCell(currentColumn + 8).setCellValue(1);
                                    break;
                                default:
                                    row.createCell(currentColumn + 9).setCellValue(1);
                                    break;
                            }
                        }
                    }
                    currentColumn+=9;
                }
                //where?
                else if(j==7)
                {
                    if(takesHealthNotes)
                    {
                        String[] items = contents.split(", ");
                        row.createCell(currentColumn).setCellValue(0);
                        row.createCell(currentColumn+1).setCellValue(0);
                        row.createCell(currentColumn+2).setCellValue(0);
                        row.createCell(currentColumn+3).setCellValue(0);
                        row.createCell(currentColumn+4).setCellValue(0);
                        for(String item : items)
                        {
                            switch (item) {
                                case "Em papel (exemplo: bloco de notas)":
                                    row.createCell(currentColumn).setCellValue(1);
                                    break;
                                case "Num livro de registo fornecido na instituição de saúde (exemplos: livro de grávida, boletim de saúde infantil e juvenil, livro para registo de tensões)":
                                    row.createCell(currentColumn + 1).setCellValue(1);
                                    break;
                                case "Numa aplicação para tomar notas (exemplos: Evernote, OneNote, Dropbox Paper, Box Notes)":
                                    row.createCell(currentColumn + 2).setCellValue(1);
                                    break;
                                case "Numa aplicação especializada (exemplos: Fitbit, MyFitnessPal, MyChart, BG Monitor Diabetes)":
                                    row.createCell(currentColumn + 3).setCellValue(1);
                                    break;
                                default:
                                    row.createCell(currentColumn + 4).setCellValue(1);
                                    break;
                            }
                        }
                    }
                    currentColumn+=4;
                }
                //do you take notes?
                else if(j==8)
                {
                    switch (contents) {
                        case "Sempre":
                            row.createCell(currentColumn).setCellValue(3);
                            break;
                        case "Muitas vezes":
                            row.createCell(currentColumn).setCellValue(2);
                            break;
                        case "Poucas vezes":
                            row.createCell(currentColumn).setCellValue(1);
                            break;
                        case "Nunca":
                            row.createCell(currentColumn).setCellValue(0);
                            break;
                    }
                }
                //does the doctor give docs?
                else if(j==9)
                {
                    switch (contents) {
                        case "Sempre":
                            row.createCell(currentColumn).setCellValue(3);
                            break;
                        case "Muitas vezes":
                            row.createCell(currentColumn).setCellValue(2);
                            break;
                        case "Poucas vezes":
                            row.createCell(currentColumn).setCellValue(1);
                            break;
                        case "Nunca":
                            row.createCell(currentColumn).setCellValue(0);
                            break;
                    }
                }
                //do you take notes of consultations?
                else if(j==10)
                {
                    switch (contents) {
                        case "Sempre":
                            row.createCell(currentColumn).setCellValue(3);
                            takesNotesOfConsultation = true;
                            break;
                        case "Muitas vezes":
                            row.createCell(currentColumn).setCellValue(2);
                            takesNotesOfConsultation = true;
                            break;
                        case "Poucas vezes":
                            row.createCell(currentColumn).setCellValue(1);
                            takesNotesOfConsultation = true;
                            break;
                        case "Nunca":
                            row.createCell(currentColumn).setCellValue(0);
                            break;
                    }
                }
                //when do you take notes of a consultation?
                else if(j==11)
                {
                    if(takesNotesOfConsultation)
                    {
                        switch (contents) {
                            case "Durante a consulta":
                                row.createCell(currentColumn).setCellValue(0);
                                break;
                            case "Imediatamente após a consulta":
                                row.createCell(currentColumn).setCellValue(1);
                                break;
                            case "Algum tempo depois da consulta":
                                row.createCell(currentColumn).setCellValue(2);
                                break;
                        }
                    }
                }
                //what info do you write?
                else if(j==12)
                {
                    if(takesNotesOfConsultation)
                    {
                        String[] items = contents.split(", ");
                        row.createCell(currentColumn).setCellValue(0);
                        row.createCell(currentColumn+1).setCellValue(0);
                        row.createCell(currentColumn+2).setCellValue(0);
                        row.createCell(currentColumn+3).setCellValue(0);
                        row.createCell(currentColumn+4).setCellValue(0);
                        row.createCell(currentColumn+5).setCellValue(0);
                        for(String item : items)
                        {
                            switch (item) {
                                case "Nomes das doenças":
                                    row.createCell(currentColumn).setCellValue(1);
                                    break;
                                case "Opiniões médicas":
                                    row.createCell(currentColumn + 1).setCellValue(1);
                                    break;
                                case "Medicamento(s) receitado(s)":
                                    row.createCell(currentColumn + 2).setCellValue(1);
                                    break;
                                case "Tratamento prescrito":
                                    row.createCell(currentColumn + 3).setCellValue(1);
                                    break;
                                case "Posologia (dose do medicamento, quando o tomar, etc.)":
                                    row.createCell(currentColumn + 4).setCellValue(1);
                                    break;
                                default:
                                    row.createCell(currentColumn + 5).setCellValue(1);
                                    break;
                            }
                        }
                    }
                    currentColumn+=5;
                }
                //do you understand the doctor?
                else if(j==13)
                {
                    switch (contents) {
                        case "Sempre":
                            row.createCell(currentColumn).setCellValue(3);
                            break;
                        case "Muitas vezes":
                            row.createCell(currentColumn).setCellValue(2);
                            doesNotUnderstandsDoctors = true;
                            break;
                        case "Poucas vezes":
                            row.createCell(currentColumn).setCellValue(1);
                            doesNotUnderstandsDoctors = true;
                            break;
                        case "Nunca":
                            row.createCell(currentColumn).setCellValue(0);
                            doesNotUnderstandsDoctors = true;
                            break;
                    }
                }
                //why don't you understand doctors?
                else if(j==14)
                {
                    if(doesNotUnderstandsDoctors)
                    {
                        String[] items = contents.split(", ");
                        row.createCell(currentColumn).setCellValue(0);
                        row.createCell(currentColumn+1).setCellValue(0);
                        row.createCell(currentColumn+2).setCellValue(0);
                        row.createCell(currentColumn+3).setCellValue(0);
                        row.createCell(currentColumn+4).setCellValue(0);
                        row.createCell(currentColumn+5).setCellValue(0);
                        row.createCell(currentColumn+6).setCellValue(0);
                        row.createCell(currentColumn+7).setCellValue(0);
                        for(String item : items)
                        {
                            switch (item) {
                                case "Pronúncia ou sotaque":
                                    row.createCell(currentColumn).setCellValue(1);
                                    break;
                                case "Volume de voz":
                                    row.createCell(currentColumn + 1).setCellValue(1);
                                    break;
                                case "Atitude":
                                    row.createCell(currentColumn + 2).setCellValue(1);
                                    break;
                                case "Uso de termos médicos ou técnicos":
                                    row.createCell(currentColumn + 3).setCellValue(1);
                                    break;
                                case "Uso de palavras \"caras\"":
                                    row.createCell(currentColumn + 4).setCellValue(1);
                                    break;
                                case "Sequência de ideias":
                                    row.createCell(currentColumn + 5).setCellValue(1);
                                    break;
                                case "Falta de tempo do médico":
                                    row.createCell(currentColumn + 6).setCellValue(1);
                                    break;
                                default:
                                    row.createCell(currentColumn + 7).setCellValue(1);
                                    break;
                            }
                        }
                    }
                    currentColumn+=7;
                }
                //do you ask to repeat?
                else if(j==15)
                {
                    if(doesNotUnderstandsDoctors)
                    {
                        switch (contents) {
                            case "Sempre":
                                row.createCell(currentColumn).setCellValue(3);
                                break;
                            case "Muitas vezes":
                                row.createCell(currentColumn).setCellValue(2);
                                doesNotAskToRepeat = true;
                                break;
                            case "Poucas vezes":
                                row.createCell(currentColumn).setCellValue(1);
                                doesNotAskToRepeat = true;
                                break;
                            case "Nunca":
                                row.createCell(currentColumn).setCellValue(0);
                                doesNotAskToRepeat = true;
                                break;
                        }
                    }
                }
                //why don't you ask to repeat?
                else if(j==16)
                {
                    if(doesNotAskToRepeat)
                    {
                        String[] items = contents.split(", ");
                        row.createCell(currentColumn).setCellValue(0);
                        row.createCell(currentColumn+1).setCellValue(0);
                        row.createCell(currentColumn+2).setCellValue(0);
                        row.createCell(currentColumn+3).setCellValue(0);
                        row.createCell(currentColumn+4).setCellValue(0);
                        row.createCell(currentColumn+5).setCellValue(0);
                        row.createCell(currentColumn+6).setCellValue(0);
                        row.createCell(currentColumn+7).setCellValue(0);
                        for(String item : items)
                        {
                            switch (item) {
                                case "Falta de confiança":
                                    row.createCell(currentColumn).setCellValue(1);
                                    break;
                                case "Receio de parecer ignorante":
                                    row.createCell(currentColumn + 1).setCellValue(1);
                                    break;
                                case "Não querer incomodar":
                                    row.createCell(currentColumn + 2).setCellValue(1);
                                    break;
                                case "Alguém lhe explicará mais tarde":
                                    row.createCell(currentColumn + 3).setCellValue(1);
                                    break;
                                case "Confia no médico e não precisa de saber mais":
                                    row.createCell(currentColumn + 4).setCellValue(1);
                                    break;
                                case "Falta de tempo ou oportunidade":
                                    row.createCell(currentColumn + 5).setCellValue(1);
                                    break;
                                case "Desinteresse":
                                    row.createCell(currentColumn + 6).setCellValue(1);
                                    break;
                                default:
                                    row.createCell(currentColumn + 7).setCellValue(1);
                                    break;
                            }
                        }
                    }
                    currentColumn+=7;
                }
                //do you have a mobile device?
                else if(j==17)
                {
                    switch (contents) {
                        case "Sim":
                            row.createCell(currentColumn).setCellValue(3);
                            hasMobileDevice = true;
                            break;
                        case "Não":
                            row.createCell(currentColumn).setCellValue(2);
                            break;
                        case "Não sei":
                            row.createCell(currentColumn).setCellValue(1);
                            break;
                    }
                }
                //what do you do on your smartphone?
                else if(j==18)
                {
                    if(hasMobileDevice)
                    {
                        String[] items = contents.split(", ");
                        row.createCell(currentColumn).setCellValue(0);
                        row.createCell(currentColumn+1).setCellValue(0);
                        row.createCell(currentColumn+2).setCellValue(0);
                        row.createCell(currentColumn+3).setCellValue(0);
                        row.createCell(currentColumn+4).setCellValue(0);
                        for(String item : items)
                        {
                            switch (item) {
                                case "Chamadas e SMS":
                                    row.createCell(currentColumn).setCellValue(1);
                                    break;
                                case "Acesso à Internet":
                                    row.createCell(currentColumn + 1).setCellValue(1);
                                    break;
                                case "Aplicações originais do dispositivo (exemplos: bloco de notas, calculadora)":
                                    row.createCell(currentColumn + 2).setCellValue(1);
                                    break;
                                case "Aplicações que instalou (exemplos: jogos, redes sociais)":
                                    row.createCell(currentColumn + 3).setCellValue(1);
                                    break;
                                default:
                                    row.createCell(currentColumn + 4).setCellValue(1);
                                    break;
                            }
                        }
                    }
                    currentColumn+=4;
                }
                //what is your operating system?
                else if(j==19)
                {
                    if(hasMobileDevice)
                    {
                        switch (contents) {
                            case "Android":
                                row.createCell(currentColumn).setCellValue(0);
                                break;
                            case "iOS":
                                row.createCell(currentColumn).setCellValue(1);
                                break;
                            case "Windows":
                                row.createCell(currentColumn).setCellValue(2);
                                break;
                            case "Blackberry":
                                row.createCell(currentColumn).setCellValue(3);
                                break;
                            case "Não sei":
                                row.createCell(currentColumn).setCellValue(4);
                                break;
                            default:
                                row.createCell(currentColumn).setCellValue(5);
                                break;
                        }
                    }
                }
                //record consultation
                else if(j==20)
                {
                    if(hasMobileDevice)
                    {
                        switch (contents) {
                            case "Não concordo":
                                row.createCell(currentColumn).setCellValue(0);
                                break;
                            case "Indiferente":
                                row.createCell(currentColumn).setCellValue(1);
                                break;
                            case "Concordo":
                                row.createCell(currentColumn).setCellValue(2);
                                break;
                        }
                    }
                }
                //transcribe
                else if(j==21)
                {
                    if(hasMobileDevice)
                    {
                        switch (contents) {
                            case "Não concordo":
                                row.createCell(currentColumn).setCellValue(0);
                                break;
                            case "Indiferente":
                                row.createCell(currentColumn).setCellValue(1);
                                break;
                            case "Concordo":
                                row.createCell(currentColumn).setCellValue(2);
                                break;
                        }
                    }
                }
                //Definitions
                else if(j==22)
                {
                    if(hasMobileDevice)
                    {
                        switch (contents) {
                            case "Não concordo":
                                row.createCell(currentColumn).setCellValue(0);
                                break;
                            case "Indiferente":
                                row.createCell(currentColumn).setCellValue(1);
                                break;
                            case "Concordo":
                                row.createCell(currentColumn).setCellValue(2);
                                break;
                        }
                    }
                }
                //notes
                else if(j==23)
                {
                    if(hasMobileDevice)
                    {
                        switch (contents) {
                            case "Não concordo":
                                row.createCell(currentColumn).setCellValue(0);
                                break;
                            case "Indiferente":
                                row.createCell(currentColumn).setCellValue(1);
                                break;
                            case "Concordo":
                                row.createCell(currentColumn).setCellValue(2);
                                break;
                        }
                    }
                }
                //would you use it?
                else if(j==24)
                {
                    if(hasMobileDevice)
                    {
                        switch (contents) {
                            case "Não":
                                row.createCell(currentColumn).setCellValue(0);
                                break;
                            case "Talvez":
                                row.createCell(currentColumn).setCellValue(1);
                                break;
                            case "Sim":
                                row.createCell(currentColumn).setCellValue(2);
                                break;
                        }
                    }
                }

                currentColumn++;
            }
        }

        FileOutputStream fileOut = new FileOutputStream(filename);
        workbook.write(fileOut);
        fileOut.close();
        System.out.println("Your excel file has been generated!");
    }
}