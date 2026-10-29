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

#J2SE - PC
package org::allbinary::data::resource::ResourceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::resource::ResourceUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{path} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{ext} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::resource::ResourceUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub setLoadingPaths {
    my ($self, $path, $ext) = @_;
        $self->{path} = $path;
        $self->{ext} = $ext;
}


sub setClassLoader {
    my ($self, $classLoader) = @_;
}


# throws Exception
sub getResourceAsStream {
    my ($self, $resource) = @_;
        my $inputStream = $self->getResourceAsStreamAtStart($resource, 2);
        if (!defined($inputStream)) {
            $inputStream = $self->getResourceAsStreamAtStart($resource, 1);
            if (!defined($inputStream)) {
                die ('org::allbinary::logic::string::StringMaker'->new()->append("Unable to obtain: ")->append($resource)->toString());
            }
        }
        return $inputStream;
}


# throws Exception
sub getResourceAsStreamAtStart {
    my ($self, $resource, $startIndex) = @_;
        my $inputStream = 'java::io::FileInputStream'->new('org::allbinary::logic::string::StringMaker'->new()->append($self->{path})->append($resource)->append($self->{ext})->toString());
        if (defined($inputStream)) {
            my $byteArray = [(0) x ($inputStream->available())];
            'org::allbinary::logic::io::StreamUtil'->getInstance()->getByteArray($inputStream, 'java::io::ByteArrayOutputStream'->new(), $byteArray);
            return 'java::io::ByteArrayInputStream'->new($byteArray);
        }
        return $inputStream;
}


sub addResource {
    my ($self, $resource, $value) = @_;
}

# use java::io::ByteArrayInputStream;
# use java::io::ByteArrayOutputStream;
# use java::io::FileInputStream;
# use java::io::InputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;

1;

