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

package org::allbinary::business::category::store::theme::StoreThemeCategoriesView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{categoryInterface} = undef;
}


sub new {
    my ($class, $categoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{categoryInterface} = $categoryInterface;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::business::category::store::theme::StoreThemeCategoryView'->new($self->{categoryInterface})->toXmlNode($document);
        my $childArray = $self->{categoryInterface}->getChildNodes()->toArray();
        my $size = scalar(@{$childArray});
        for (my $i = 0; $i < $size; $i++) {
            my $childCategoryInterface = $childArray->[$i];
            my $childCategoryNode = 'org::allbinary::business::category::store::theme::StoreThemeCategoriesView'->new($childCategoryInterface)->toXmlNode($document);
            $node->appendChild($childCategoryNode);
        }
        return $node;
}

use org::allbinary::business::category::CategoryInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::category::store::theme::StoreThemeCategoryView;

1;

