#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::servlet::file::UploadFileServlet;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::servlet::http::HttpServlet';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{requestHashMap} = undef;
    $self->{fileName} = undef;
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws ServletException, IOException
sub processRequest {
    my ($self, $request, $response) = @_;
        my $isError = 0;
        my $inputStream = undef;
        try {
            'org::allbinary::servlet::BlisketServletUtil'->getInstance()->init($request);
            $self->{requestHashMap} = 'org::allbinary::logic::communication::http::request::MultipartRequestParams'->new($request)->toHashMap();
            my $filePath = $self->{requestHashMap}->get('org::allbinary::logic::communication::http::file::upload::FileUploadData'->getInstance()->{UPLOAD_TO_FILE_PATH});
            if (!defined($filePath)) {
                $isError = 1;
                $response->sendError($javax::servlet::http::HttpServletResponse::SC_NOT_FOUND);
                return;
            }
            my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $authenticationHelper = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($hashMap, $request);
            if ($authenticationHelper->isAuthenticated()) {
                if ('admin::taghelpers::AuthenticationHelperUtil'->getInstance()->isAuthorized($authenticationHelper, $filePath)) {
                    $self->saveFile($filePath);
                    $response->setContentType("text/plain");
                    $response->getOutputStream()->write([unpack("C*", "OK!")]);
                } else {
                    $isError = 1;
                    $response->sendError($javax::servlet::http::HttpServletResponse::SC_UNAUTHORIZED, "You are not Authorized");
                }
            } else {
                $isError = 1;
                $response->sendError($javax::servlet::http::HttpServletResponse::SC_UNAUTHORIZED, "Please Login");
            }
        } catch ($e) {
            if ($org::allbinary::servlet::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::servlet::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "processRequest()", $e);
            }
            $isError = 1;
            $response->sendError($javax::servlet::http::HttpServletResponse::SC_NOT_FOUND);
        } finally {
            if (!$isError) {
                'org::allbinary::logic::io::StreamUtil'->getInstance()->close($response->getOutputStream());
            }
            if (!'org::allbinary::logic::io::StreamUtil'->getInstance()->close($inputStream)) {
            }
        }
}


# throws Exception
sub saveFile {
    my ($self, $filePath) = @_;
        my $fileOutputStream = undef;
        try {
            my $fileItem = $self->{requestHashMap}->get('org::allbinary::logic::communication::http::file::upload::FileUploadData'->getInstance()->{FILE_DATA});
            if (defined($fileItem) && $fileItem->getSize() > 1) {
                $self->{fileName} = 'org::allbinary::logic::communication::http::request::HttpRequestUtil'->getInstance()->generateFileName($fileItem->getName());
                if ((substr($filePath, -length("/")) eq "/") || (substr($filePath, -length("\\")) eq "\\")) {
                    $filePath = $filePath . $self->{fileName};
                }
                my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFile('org::allbinary::globals::URLGLOBALS'->getWebappPath() . $filePath);
                if ($org::allbinary::servlet::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::servlet::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("Uploaded File: ");
                    $stringBuffer->append($self->{fileName});
                    $stringBuffer->append(" New File: ");
                    $stringBuffer->append($file->getPath());
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "saveFile()");
                }
                'org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->log($fileItem);
                my $byteArray = $fileItem->get();
                if ($file->isFile()) {
                    $file->delete();
                    $file->createNewFile();
                }
                $fileOutputStream = 'org::allbinary::logic::io::AbFileOutputStream'->createFromAbFile($file);
                $fileOutputStream->write($byteArray);
            }
        } catch ($exception) { die $exception; } finally {
            if (defined($fileOutputStream)) {
                $fileOutputStream->close();
            }
        }
}


# throws ServletException, IOException
sub doGet {
    my ($self, $request, $response) = @_;
        $self->processRequest($request, $response);
}


# throws ServletException, IOException
sub doPost {
    my ($self, $request, $response) = @_;
        $self->processRequest($request, $response);
}


sub getServletInfo {
    my ($self) = @_;
        return "Upload Cloud Files";
}

# use java::io::IOException;
# use java::io::InputStream;
use java::util::HashMap;
# use javax::servlet::ServletException;
# use javax::servlet::http::HttpServlet;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::http::HttpServletResponse;
use admin::taghelpers::AuthenticationHelper;
use admin::taghelpers::AuthenticationHelperFactory;
use admin::taghelpers::AuthenticationHelperUtil;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::file::upload::FileUploadData;
use org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil;
use org::allbinary::logic::communication::http::request::HttpRequestUtil;
use org::allbinary::logic::communication::http::request::MultipartRequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbFileOutputStream;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::servlet::BlisketServletUtil;
use org::allbinary::string::CommonStrings;
use org::apache::commons::fileupload::FileItem;

1;

