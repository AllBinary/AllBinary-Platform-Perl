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

package org::allbinary::logic::communication::http::file::upload::AbFileItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::apache::commons::fileupload::FileItem';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{name} = undef;
    $self->{fieldName} = undef;
    $self->{byteArray} = undef;
}


sub new {
    my ($class, $name, $fieldName, $byteArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{fieldName} = $fieldName;
        $self->{byteArray} = $byteArray;
    return $self;
}


# throws IOException
sub getInputStream {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub getContentType {
    my ($self) = @_;
        return undef;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub isInMemory {
    my ($self) = @_;
        return 1;
}


sub getSize {
    my ($self) = @_;
        return scalar(@{$self->{byteArray}});
}


sub get {
    my ($self) = @_;
        return $self->{byteArray};
}


# throws UnsupportedEncodingException
sub getString {
    my ($self, $encoding) = @_;
        return pack("C*", @{$self->{byteArray}, $encoding});
}


# Java overloaded method: Perl keeps the last definition
sub getString {
    my ($self) = @_;
        try {
            return 'org::apache::commons::fileupload::FileItemUtil'->getInstance()->getString($self->{byteArray});
        } catch ($e) {
            if ($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::file::upload::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getString", $e);
            }
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
}


# throws Exception
sub write {
    my ($self, $file) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $file) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub delete {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, "delete()");
}


sub getFieldName {
    my ($self) = @_;
        return $self->{fieldName};
}


sub setFieldName {
    my ($self, $name) = @_;
        $self->{fieldName} = $name;
}


sub isFormField {
    my ($self) = @_;
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{fieldName})) {
            return 0;
        } else {
            return 1;
        }
}


sub setFormField {
    my ($self, $state) = @_;
}


# throws IOException
sub getOutputStream {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub getHeaders {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub setHeaders {
    my ($self, $fih) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}

use java::io::File;
# use java::io::IOException;
# use java::io::InputStream;
# use java::io::OutputStream;
# use java::io::UnsupportedEncodingException;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;
use org::apache::commons::fileupload::FileItem;
use org::apache::commons::fileupload::FileItemHeaders;
use org::apache::commons::fileupload::FileItemUtil;

1;

