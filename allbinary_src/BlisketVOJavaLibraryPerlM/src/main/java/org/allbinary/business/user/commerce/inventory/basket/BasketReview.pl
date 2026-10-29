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

package org::allbinary::business::user::commerce::inventory::basket::BasketReview;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{items} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isValid {
    my ($self) = @_;
        return 1;
}


sub addItem {
    my ($self, $item) = @_;
        $self->{items}->add($item);
}


sub getItems {
    my ($self) = @_;
        return $self->{items};
}


sub removeItem {
    my ($self, $id) = @_;
        my $itemArray = $self->{items}->toArray();
        my $size = scalar(@{$itemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $itemArray->[$index];
            if ($item->getId()->compareTo($id) == 0) {
                $self->{items}->remove($item);
            }
        }
}


sub adjustItem {
    my ($self, $id, $num) = @_;
        my $itemArray = $self->{items}->toArray();
        my $size = scalar(@{$itemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $itemArray->[$index];
            if ($item->getId()->compareTo($id) == 0) {
                $item->setNumber($num);
            }
        }
}


sub getTotalWeight {
    my ($self) = @_;
        my $weightFloat = 0.0;
        my $itemArray = $self->{items}->toArray();
        my $size = scalar(@{$itemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $itemArray->[$index];
            $weightFloat += $item->getWeight();
        }
        return $weightFloat->toString();
}


sub getNumberOfItems {
    my ($self) = @_;
        return $self->{items}->size();
}


sub getIds {
    my ($self) = @_;
        my $idSet = 'java::util::HashSet'->new();
        my $itemArray = $self->{items}->toArray();
        my $size = scalar(@{$itemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $itemArray->[$index];
            $idSet->add($item->getId());
        }
        return $idSet;
}


sub getNumberOf {
    my ($self, $id) = @_;
        my $itemArray = $self->{items}->toArray();
        my $size = scalar(@{$itemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $itemArray->[$index];
            if ($item->getId()->compareTo($id) == 0) {
                return $item->getNumber();
            }
        }
        return 0;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::business::user::commerce::inventory::basket::BasketData::BASKET);
        my $itemArray = $self->{items}->toArray();
        my $size = scalar(@{$itemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $itemArray->[$index];
            $node->appendChild('org::allbinary::business::user::commerce::inventory::item::ItemView'->new($item, 'org::allbinary::util::BasicArrayListD'->new())->toXmlNode($document));
        }
        return $node;
}

# use java::util::HashSet;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::inventory::item::Item;
use org::allbinary::business::user::commerce::inventory::item::ItemView;
use org::allbinary::logic::StdUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::inventory::basket::BasketData;

1;

