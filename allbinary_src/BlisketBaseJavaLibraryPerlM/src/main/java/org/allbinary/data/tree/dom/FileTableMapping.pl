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

package org::allbinary::data::tree::dom::FileTableMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{file} = undef;
}


sub new {
    my ($class, $file) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{file} = $file;
    return $self;
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return $self->{file}->getPath();
}


# throws Exception
sub toVector {
    my ($self) = @_;
        my $filePropertyVector = 'org::allbinary::util::BasicArrayListD'->new();
        $filePropertyVector->add($self->{file}->getAbsolutePath());
        $filePropertyVector->add($self->{file}->getCanonicalPath());
        $filePropertyVector->add($self->{file}->getName());
        $filePropertyVector->add($self->{file}->getParent());
        $filePropertyVector->add($self->{file}->getPath());
        return $filePropertyVector;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $filePropertyHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $pathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
        my $pathUtil = 'org::allbinary::logic::io::path::PathUtil'->getInstance();
        my $rootFileName = $pathData->getNameFromPath($pathUtil->getWithoutExtension($self->{file}->getPath()));
        my $fileData = 'org::allbinary::logic::io::file::FileData'->getInstance();
        $filePropertyHashMap->put($fileData->{ROOT_NAME}, $rootFileName);
        $filePropertyHashMap->put($fileData->{ISFILE}, ("" . ($self->{file}->isFile()))->toString());
        $filePropertyHashMap->put($fileData->{ISDIRECTORY}, ("" . ($self->{file}->isDirectory()))->toString());
        $filePropertyHashMap->put($fileData->{ISHIDDEN}, ("" . ($self->{file}->isHidden()))->toString());
        $filePropertyHashMap->put($fileData->{ISABSOLUTE}, ("" . ($self->{file}->isAbsolute()))->toString());
        $filePropertyHashMap->put($fileData->{ABSOLUTE_PATH}, $self->{file}->getAbsolutePath());
        $filePropertyHashMap->put($fileData->{CANONICAL_PATH}, $self->{file}->getCanonicalPath());
        $filePropertyHashMap->put($fileData->{NAME}, $self->{file}->getName());
        $filePropertyHashMap->put($fileData->{PARENT}, $self->{file}->getParent());
        $filePropertyHashMap->put($fileData->{PATH}, $self->{file}->getPath());
        return $filePropertyHashMap;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileData;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::io::path::PathUtil;

1;

