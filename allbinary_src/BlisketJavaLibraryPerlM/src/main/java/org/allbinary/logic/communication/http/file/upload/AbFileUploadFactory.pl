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

package org::allbinary::logic::communication::http::file::upload::AbFileUploadFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::http::file::upload::AbFileUploadFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::http::file::upload::AbFileUploadFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getFileItemStreamList {
    my ($self, $httpServletRequest) = @_;
        try {
            my $fileUpload = 'org::allbinary::logic::communication::http::file::upload::AbFileUpload'->new('org::allbinary::logic::communication::http::AbFileItemFactory'->new());
            my $iterator = $fileUpload->getItemIterator($httpServletRequest);
            my $items = 'java::util::ArrayList'->new();
            while ($iterator->hasNext()) {
                my $fileItemStream = $iterator->next();
                'org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->log($fileItemStream);
                my $fileItem = 'org::allbinary::logic::communication::http::file::upload::AbFileItem'->new($fileItemStream->getName(), $fileItemStream->getFieldName(), 'org::apache::commons::fileupload::FileItemUtil'->getInstance()->getBytes($fileItemStream));
                $items->add($fileItem);
            }
            return $items;
        } catch ($e) {
            if ($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "get()", $e);
            }
            die $e;
        }
}


# throws Exception
sub getFileItemList {
    my ($self, $httpServletRequest) = @_;
        try {
            my $abFileUpload = 'org::allbinary::logic::communication::http::file::upload::AbFileUpload'->new('org::allbinary::logic::communication::http::AbFileItemFactory'->new());
            return $abFileUpload->parseRequest($httpServletRequest);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "get()", $e);
            }
            die $e;
        }
}

use java::util::ArrayList;
# use java::util::List;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::logic::communication::http::AbFileItemFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::apache::commons::fileupload::FileItemIterator;
use org::apache::commons::fileupload::FileItemStream;
use org::apache::commons::fileupload::FileItemUtil;
use org::allbinary::logic::communication::http::file::upload::AbFileUpload;
use org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil;
use org::allbinary::logic::communication::http::file::upload::AbFileItem;

1;

