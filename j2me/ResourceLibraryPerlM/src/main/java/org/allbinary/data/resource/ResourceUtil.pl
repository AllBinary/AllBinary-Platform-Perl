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

#J2SE - J2ME
package org::allbinary::data::resource::ResourceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $classLoader = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
our $instance = 'org::allbinary::data::resource::ResourceUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
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
        $self->{logUtil}->putF('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED}, $self, "setLoadingPaths");
}


sub setClassLoader {
    my ($self, $classLoader) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Resource Loader: ")->append(ref($classLoader))->toString(), $self, "setClassLoader");
        $org::allbinary::data::resource::ResourceUtil::classLoader = $classLoader;
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
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $index = index($resource, $commonSeps->{COLON});
        my $resourcePath = substr($resource, $index + $startIndex);
        my $inputStream = ref($resource)->getResourceAsStream($resourcePath);
        if (defined($inputStream)) {
            return $inputStream;
        }
        my $classLoader = $org::allbinary::data::resource::ResourceUtil::classLoader;
        $inputStream = $classLoader->getResourceAsStream($resourcePath);
        if (defined($inputStream)) {
            return $inputStream;
        }
        $inputStream = 'java::lang::Thread'->currentThread()->getContextClassLoader()->getResourceAsStream($resourcePath);
        if (defined($inputStream)) {
            return $inputStream;
        }
        return $inputStream;
}


sub addResource {
    my ($self, $resource, $value) = @_;
}

# use java::io::InputStream;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use java::lang::Thread;

1;

