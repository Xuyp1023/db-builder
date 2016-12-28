/**
 test
**/

var Byte = java.lang.Byte;
var File = java.io.File;
var String = java.io.String;
var Character = java.lang.Character;
var FileReader = java.io.FileReader;
var FileWriter = java.io.FileWriter;
var InputStreamReader = java.io.InputStreamReader;
var OutputStreamWriter = java.io.OutputStreamWriter;
var BufferedWriter = java.io.BufferedWriter;
var BufferedReader = java.io.BufferedReader;
var FileOutputStream = java.io.FileOutputStream;
var FileInputStream = java.io.FileInputStream;

var Files = java.nio.file.Files;
var Paths = java.nio.file.Paths;
var Path = java.nio.file.Path;
var DirectoryStream = java.nio.file.DirectoryStream;

var params = {
	dbscriptsdir:'' + attributes.get('dbscriptsdir'),
	outputdir:'' + attributes.get('outputdir'),
	tempdir:'' + attributes.get('tempdir'),
	version:'' + attributes.get('version'),
	ddldir:'' + attributes.get('dbscriptsdir') + "/" + '' + attributes.get('version') + "/ddl",
	dmldir:'' + attributes.get('dbscriptsdir') + "/" + '' + attributes.get('version') + "/dml"
};
//-- set default value for the input attributes (Note that all attributes should be in lower-case)

params.ddl_pre = params.tempdir + "/sql/01-ddl-pre-" + params.version + ".sql";
params.ddl = params.tempdir + "/sql/03-ddl-" + params.version + ".sql";
params.ddl_post = params.tempdir + "/sql/05-ddl-post-" + params.version + ".sql";

params.dml_pre = params.tempdir + "/sql/02-dml-pre-" + params.version + ".sql";
params.dml = params.tempdir + "/sql/04-dml-" + params.version + ".sql";
params.dml_post = params.tempdir + "/sql/06-dml-post-" + params.version + ".sql";


prepare(params);


function prepare(params) {
	var tempdir = new File(params.tempdir + "/sql");
	if (!tempdir.exists()) {
		tempdir.mkdirs();
	} else {
		var files = tempdir.listFiles();
		for (var i = 0; i < files.length; i++) {
			files[i].delete();
		}
	}
	var dbdir = new File(params.outputdir + "/db");
	if (!dbdir.exists()) {
		dbdir.mkdirs();
	} else {
		var files = dbdir.listFiles();
		for (var i = 0; i < files.length; i++) {
			files[i].delete();
		}
	}
	var sqldir = new File(params.outputdir + "/sql");
	if (!sqldir.exists()) {
		sqldir.mkdirs();
	} else {
		var files = sqldir.listFiles();
		for (var i = 0; i < files.length; i++) {
			files[i].delete();
		}
	}
};


combine(params);


function combine(params) {

	var ddlPreFile = new File(params.ddl_pre);
	ddlPreFile.createNewFile();
	var ddlPreFileOutputStream = new FileOutputStream(ddlPreFile);
	var ddlPreFileWriter = new OutputStreamWriter(ddlPreFileOutputStream, "UTF-8");
	
	var ddlFile = new File(params.ddl);
	ddlFile.createNewFile();
	var ddlFileOutputStream = new FileOutputStream(ddlFile);
	var ddlFileWriter = new OutputStreamWriter(ddlFileOutputStream, "UTF-8");
	
	var ddlPostFile = new File(params.ddl_post);
	ddlPostFile.createNewFile();
	var ddlPostFileOutputStream = new FileOutputStream(ddlPostFile);
	var ddlPostFileWriter = new OutputStreamWriter(ddlPostFileOutputStream, "UTF-8");
	
	var dmlPreFile = new File(params.dml_pre);
	dmlPreFile.createNewFile();
	var dmlPreFileOutputStream = new FileOutputStream(dmlPreFile);
	var dmlPreFileWriter = new OutputStreamWriter(dmlPreFileOutputStream, "UTF-8");
	
	var dmlFile = new File(params.dml);
	dmlFile.createNewFile();
	var dmlFileOutputStream = new FileOutputStream(dmlFile);
	var dmlFileWriter = new OutputStreamWriter(dmlFileOutputStream, "UTF-8");
	
	var dmlPostFile = new File(params.dml_post);
	dmlPostFile.createNewFile();
	var dmlPostFileOutputStream = new FileOutputStream(dmlPostFile);
	var dmlPostFileWriter = new OutputStreamWriter(dmlPostFileOutputStream, "UTF-8");
	
	var ddldirs = Files.newDirectoryStream(Paths.get(params.ddldir));
	
	var it = ddldirs.iterator();
    while(it.hasNext()){
		var path = it.next();
		var fileName = path.toFile().getName();
		if (test(fileName, /^000\-ddl\-pre[\-\w]*\.sql$/)) {
			fileMerge(path.toFile(), ddlPreFileWriter);
			ddlPreFileWriter.flush();
		}
		if (test(fileName, /^500\-ddl[\-\w]*\.sql$/)) {
			fileMerge(path.toFile(), ddlFileWriter);
			ddlFileWriter.flush();
		}
		if (test(fileName, /^900\-ddl\-post[\-\w]*\.sql$/)) {
			fileMerge(path.toFile(), ddlPostFileWriter);
			ddlPostFileWriter.flush();
		}
    }
	
	
	var dmldirs = Files.newDirectoryStream(Paths.get(params.dmldir));
	
	
	var it = dmldirs.iterator();
    while(it.hasNext()){
		var path = it.next();
		var fileName = path.toFile().getName();
		if (test(fileName, /^000\-dml\-pre[\-\w]*\.sql$/)) {
			fileMerge(path.toFile(), dmlPreFileWriter);
			dmlPreFileWriter.flush();
		}
		if (test(fileName, /^500\-dml[\-\w]*\.sql$/)) {
			fileMerge(path.toFile(), dmlFileWriter);
			dmlFileWriter.flush();
		}
		if (test(fileName, /^900\-dml\-post[\-\w]*\.sql$/)) {
			fileMerge(path.toFile(), dmlPostFileWriter);
			dmlPostFileWriter.flush();
		}
    }

	ddlPreFileWriter.close();
	
	ddlFileWriter.close();
	ddlPostFileWriter.close();
	dmlPreFileWriter.close();
	dmlFileWriter.close();
	dmlPostFileWriter.close();
	ddlPreFileOutputStream.close();
	ddlFileOutputStream.close();
	ddlPostFileOutputStream.close();
	dmlPreFileOutputStream.close();
	dmlFileOutputStream.close();
	dmlPostFileOutputStream.close();
}

function fileMerge(src, fos) {

	try {
		var b = "";
		
		var fis = new InputStreamReader(new FileInputStream(src), "UTF-8");
		var bufr = new BufferedReader(fis);
		var bufw = new BufferedWriter(fos);
		bufw.newLine();
		bufw.newLine();
		bufw.write("### ------------ file: " + src.getName());
		bufw.newLine();
		while ((b = bufr.readLine()) != null) {
			bufw.write(b);
			bufw.newLine();
		}
		bufw.newLine();
		bufw.newLine();
		bufw.flush();
	} catch (e) {
		self.log(src.getName() + "combine failure!" + e);
	}
}


function test(fileName, reg) {
	if (!reg.exec(fileName)) return false 
	return true 
}