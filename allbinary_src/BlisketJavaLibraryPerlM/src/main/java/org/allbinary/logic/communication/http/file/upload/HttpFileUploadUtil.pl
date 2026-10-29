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

package org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();

our $instance = 'org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub isValid {
    my ($self, $anyType) = @_;
        if (defined($anyType) && !((Scalar::Util::blessed($anyType) && $anyType->isa('String')))) {
            if ((Scalar::Util::blessed($anyType) && $anyType->isa('org::apache::commons::fileupload::FileItem'))) {
                return 1;
            } else {
                die ("Object Not Instance Of FileItem but is: " . 'org::allbinary::logic::java::anyType::clazz::ClassUtil'->viewAll($anyType, 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE}));
            }
        }
        return 0;
}


# throws Exception
sub log {
    my ($class, $fileItem) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $stringBuffer->append("FileItem Log:");
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append("Content Type:");
        $stringBuffer->append($fileItem->getContentType());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append("Field Name:");
        $stringBuffer->append($fileItem->getFieldName());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append("Name:");
        $stringBuffer->append($fileItem->getName());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append("Size:");
        $stringBuffer->append(" Not Calculated Yet");
        if ($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTP})) {
            $logUtil->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "log()");
        }
}


# Java overloaded method: Perl keeps the last definition
sub log {
    my ($class, $fileItem) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $stringBuffer->append("FileItem Log:");
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append("Content Type:");
        $stringBuffer->append($fileItem->getContentType());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append("Field Name:");
        $stringBuffer->append($fileItem->getFieldName());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append("Name:");
        $stringBuffer->append($fileItem->getName());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append("Size:");
        $stringBuffer->appendlong(int($fileItem->getSize()));
        if ($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $logUtil->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "log()");
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::anyType::clazz::ClassUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::apache::commons::fileupload::FileItem;
use org::apache::commons::fileupload::FileItemStream;

1;

