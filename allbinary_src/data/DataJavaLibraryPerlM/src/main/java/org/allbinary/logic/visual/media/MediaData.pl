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

package org::allbinary::logic::visual::media::MediaData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{type} = undef;
    $self->{extension} = undef;
}


sub new {
    my ($class, $a_Name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $a_Name;
        $self->{extension} = "." . $self->{name};
        $self->{type} = 'org::allbinary::logic::visual::media::MediaTypeData'->getInstance()->{NOT_RESIZABLE_MEDIA};
        $org::allbinary::logic::visual::media::MediaData::hashMap->put($a_Name, $self);
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub getExtension {
    my ($self) = @_;
        return $self->{extension};
}


sub isConvertableTo {
    my ($self, $mediaData) = @_;
        if ($self == 'org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{GIF} && $mediaData == 'org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{JPG}) {
            return 1;
        }
        return 0;
}


sub toString {
    my ($self) = @_;
        return $self->getName();
}


# throws Exception
sub get {
    my ($class, $a_Name) = @_;
        my $mediaData = $org::allbinary::logic::visual::media::MediaData::hashMap->get($a_Name);
        if (defined($mediaData)) {
            return $mediaData;
        } else {
            die ("No Such MediaData");
        }
}


sub getDefault {
    my ($class) = @_;
        return 'org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{JPG};
}


sub toHashMap {
    my ($class) = @_;
        return $org::allbinary::logic::visual::media::MediaData::hashMap;
}

use java::util::HashMap;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::visual::media::MediaTypeData;
use org::allbinary::logic::visual::media::MediaDataFactory;

1;

