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

package org::allbinary::servlet::ImageServlet;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::servlet::http::HttpServlet';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
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
            my $requestURI = $request->getRequestURI();
            my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFile('org::allbinary::globals::URLGLOBALS'->getWebappPath() . $requestURI);
            $inputStream = 'org::allbinary::logic::io::CloudStreamUtil'->getInstance()->getFileLocal($file);
            my $outputStream = 'java::io::ByteArrayOutputStream'->new(8000);
            my $byteArray = 'org::allbinary::logic::io::StreamUtil'->getInstance()->getByteArray($inputStream, $outputStream, [(0) x (16384)]);
            $response->setContentType("image/jpeg;charset=utf-8");
            $response->getOutputStream()->write($byteArray);
        } catch ($e) {
            if ($org::allbinary::servlet::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::servlet::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "processRequest()", $e);
            }
        } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($response->getOutputStream());
            if (!'org::allbinary::logic::io::StreamUtil'->getInstance()->close($inputStream)) {
                $response->sendError($javax::servlet::http::HttpServletResponse::SC_NOT_FOUND);
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
        return "Serves Up Image";
}

# use java::io::ByteArrayOutputStream;
# use java::io::IOException;
# use java::io::InputStream;
# use javax::servlet::ServletException;
# use javax::servlet::http::HttpServlet;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::http::HttpServletResponse;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::CloudStreamUtil;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::string::CommonStrings;
use org::allbinary::servlet::BlisketServletUtil;

1;

