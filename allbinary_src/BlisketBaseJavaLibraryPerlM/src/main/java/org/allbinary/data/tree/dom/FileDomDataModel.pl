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

package org::allbinary::data::tree::dom::FileDomDataModel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


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
sub toXmlNode {
    my ($self, $document) = @_;
        my $tableMappingInterface = 'org::allbinary::data::tree::dom::FileTableMapping'->new($self->{file});
        my $hashMap = $tableMappingInterface->toHashMap();
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, "file", $hashMap);
}

use java::util::HashMap;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::io::file::AbFile;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::FileTableMapping;
use org::allbinary::data::tree::dom::ModDomHelper;

1;

