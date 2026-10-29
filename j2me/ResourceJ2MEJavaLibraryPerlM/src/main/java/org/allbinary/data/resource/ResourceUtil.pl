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

#J2ME
package org::allbinary::data::resource::ResourceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

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


# throws Exception
sub getResourceAsStream {
    my ($self, $resource) = @_;
        my $inputStream = ref($resource)->getResourceAsStream($resource);
        if (!defined($inputStream)) {
            $inputStream = $self->getResourceAsStreamAtStart($resource, 2);
            if (!defined($inputStream)) {
                $inputStream = $self->getResourceAsStreamAtStart($resource, 1);
                if (!defined($inputStream)) {
                    my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
                    my $index = rindex($resource, "/");
                    my $resourcePath = substr($resource, $index + 1);
                    $inputStream = ref($resource)->getResourceAsStream($resourcePath);
                    if (!defined($inputStream)) {
                        $resourcePath = substr($resource, $index);
                        $inputStream = ref($resource)->getResourceAsStream($resourcePath);
                        if (!defined($inputStream)) {
                            my $RES = "res";
                            $resourcePath = $stringMaker->append($RES)->append(substr($resource, $index))->toString();
                            $inputStream = ref($resource)->getResourceAsStream($resourcePath);
                            if (!defined($inputStream)) {
                                $stringMaker->delete(0, $stringMaker->length());
                                $resourcePath = $stringMaker->append("/")->append($RES)->append(substr($resource, $index))->toString();
                                $inputStream = ref($resource)->getResourceAsStream($resourcePath);
                                my $COLON = 'org::allbinary::string::CommonSeps'->getInstance()->{COLON};
                                if (!defined($inputStream)) {
                                    $stringMaker->delete(0, $stringMaker->length());
                                    $resourcePath = $stringMaker->append($RES)->append($COLON)->append(substr($resource, $index))->toString();
                                    $inputStream = ref($resource)->getResourceAsStream($resourcePath);
                                    if (!defined($inputStream)) {
                                        $stringMaker->delete(0, $stringMaker->length());
                                        $resourcePath = $stringMaker->append($RES)->append($COLON)->append(substr($resource, $index + 1))->toString();
                                        $inputStream = ref($resource)->getResourceAsStream($resourcePath);
                                        if (!defined($inputStream)) {
                                            my $RESOURCE_STRING = "resource";
                                            $stringMaker->delete(0, $stringMaker->length());
                                            $resourcePath = $stringMaker->append($RESOURCE_STRING)->append($COLON)->append(substr($resource, $index))->toString();
                                            $inputStream = ref($resource)->getResourceAsStream($resourcePath);
                                            if (!defined($inputStream)) {
                                                $stringMaker->delete(0, $stringMaker->length());
                                                $resourcePath = $stringMaker->append($RESOURCE_STRING)->append($COLON)->append(substr($resource, $index + 1))->toString();
                                                $inputStream = ref($resource)->getResourceAsStream($resourcePath);
                                                if (!defined($inputStream)) {
                                                    $stringMaker->delete(0, $stringMaker->length());
                                                    die ($stringMaker->append("Unable to obtain: ")->append($resource)->toString());
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return $inputStream;
}


# throws Exception
sub getResourceAsStreamAtStart {
    my ($self, $resource, $startIndex) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $index = index($resource, 'org::allbinary::string::CommonSeps'->getInstance()->{COLON});
        my $resourcePath = substr($resource, $index + $startIndex);
        my $inputStream = ref($resource)->getResourceAsStream($resourcePath);
        if (defined($inputStream)) {
            return $inputStream;
        }
        return $inputStream;
}


sub addResource {
    my ($self, $resource, $value) = @_;
}

# use java::io::InputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;

1;

