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

package org::allbinary::logic::communication::http::request::MultipartRequestParams;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::http::request::RequestParams';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{special} = 0;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of MultipartRequestParams takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $request) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->processMultipartRequest($request);
    return $self;
}


sub _new1 {
    my ($class, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->processMultipartRequest($pageContext->getRequest());
    return $self;
}


sub setSpecial {
    my ($self) = @_;
        $self->{special} = 1;
}


sub processMultipartRequest {
    my ($self, $request) = @_;
        try {
            my $specialRequest = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $multipartRequestList = 'org::allbinary::logic::communication::http::file::upload::AbFileUploadFactory'->getInstance()->getFileItemStreamList($request);
            if (defined($multipartRequestList)) {
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("FileItem List Size: " . $multipartRequestList->size(), $self, "processMultipartRequest()");
                }
                my $fileItemArray = $multipartRequestList->toArray();
                my $size = scalar(@{$fileItemArray});
                for (my $index = 0; $index < $size; $index++) {
                    my $fileItem = $fileItemArray->[$index];
                    my $name = $fileItem->getName();
                    if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($name)) {
                        $specialRequest->put($fileItem->getFieldName(), $fileItem->getString());
                    } else {
                        $specialRequest->put($fileItem->getFieldName(), $fileItem);
                    }
                }
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("Special Request Data: " . $specialRequest->toString(), $self, "processMultipartRequest()");
                }
                $self->setSpecial();
                $self->setMap($specialRequest);
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                $self->{logUtil}->putF("Using Normal RequestParams", $self, "processMultipartRequest()");
            }
            $self->SUPER::setMap($request->getParameterMap());
        }
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        if ($self->{special}) {
            return $self->getMap();
        } else {
            return $self->SUPER::toHashMap();
        }
}

use java::util::HashMap;
# use java::util::List;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::file::upload::AbFileUploadFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::apache::commons::fileupload::FileItem;
use org::apache::commons::fileupload::FileUploadBase::InvalidContentTypeException;
use org::allbinary::logic::communication::http::request::RequestParams;

1;

