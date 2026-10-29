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

package org::allbinary::servlet::file::DownloadFileServlet;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::servlet::http::HttpServlet';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{DOWNLOAD} = "download";
    $self->{DEFAULT_BUFFER_SIZE} = 16384;
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
        my $inputStream = undef;
        try {
            'org::allbinary::servlet::BlisketServletUtil'->getInstance()->init($request);
            my $requestPath = $request->getRequestURI();
            if (!defined($requestPath)) {
                $response->sendError($javax::servlet::http::HttpServletResponse::SC_NOT_FOUND);
                return;
            }
            my $beginIndex = index($requestPath, $self->{DOWNLOAD});
            my $filePath = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            if ($beginIndex >= 0) {
                $filePath = substr($requestPath, $beginIndex + length($self->{DOWNLOAD}));
            } else {
                $response->sendError($javax::servlet::http::HttpServletResponse::SC_NOT_FOUND);
            }
            my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFile('org::allbinary::globals::URLGLOBALS'->getWebappPath() . $filePath);
            if (!$file->exists()) {
                $response->sendError($javax::servlet::http::HttpServletResponse::SC_NOT_FOUND);
                return;
            }
            my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $authenticationHelper = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($hashMap, $request);
            if ($authenticationHelper->isAuthenticated()) {
                if ('admin::taghelpers::AuthenticationHelperUtil'->getInstance()->isAuthorized($authenticationHelper, $filePath)) {
                    $inputStream = 'org::allbinary::logic::io::CloudStreamUtil'->getInstance()->getFile($file);
                    my $contentType = $self->getServletContext()->getMimeType($file->getName());
                    if (!defined($contentType)) {
                        $contentType = "application/octet-stream";
                    }
                    $response->reset();
                    $response->setBufferSize($self->{DEFAULT_BUFFER_SIZE});
                    $response->setContentType($contentType);
                    $response->setHeader("Content-Length", ("" . ($file->length())));
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("attachment; filename=\"");
                    $stringBuffer->append($file->getName());
                    $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{QUOTE});
                    $response->setHeader("Content-Disposition", $stringBuffer->toString());
                    'org::allbinary::logic::io::StreamUtil'->getInstance()->get($inputStream, $response->getOutputStream(), [(0) x (16348)]);
                } else {
                    $response->sendError($javax::servlet::http::HttpServletResponse::SC_UNAUTHORIZED, "You are not Authorized");
                }
            } else {
                $response->sendError($javax::servlet::http::HttpServletResponse::SC_UNAUTHORIZED, "Please Login");
            }
        } catch ($e) {
            if ($org::allbinary::servlet::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::servlet::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "processRequest()", $e);
            }
            $response->sendError($javax::servlet::http::HttpServletResponse::SC_NOT_FOUND);
        } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($response->getOutputStream());
            if (!'org::allbinary::logic::io::StreamUtil'->getInstance()->close($inputStream)) {
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
        return "Serves Up Cloud Files";
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
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::CloudStreamUtil;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::servlet::BlisketServletUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;

1;

