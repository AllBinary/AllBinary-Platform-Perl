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

package org::allbinary::logic::control::search::SearchParams;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{columnsAndSearchValues} = undef;
    $self->{order} = undef;
    $self->{sortBy} = undef;
    $self->{listLength} = undef;
    $self->{startPage} = undef;
    $self->{endPage} = undef;
}


sub new {
    my ($class, $request) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{columnsAndSearchValues} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->setLength($request->getParameter($org::allbinary::logic::control::search::SearchData::LENGTH));
        $self->setOrder($request->getParameter($org::allbinary::logic::control::search::SearchData::ORDER));
        my $page = $request->getParameter($org::allbinary::logic::control::search::SearchData::PAGE);
        $self->setStartPage($page);
        $self->setEndPage($page);
        $self->setSortBy($request->getParameter($org::allbinary::logic::control::search::SearchData::SORTBY));
        my $index = 0;
        my $columnName = $request->getParameter($org::allbinary::logic::control::search::SearchData::COLUMNNAME . "[0]");
        my $columnValue = $request->getParameter($org::allbinary::logic::control::search::SearchData::COLUMNVALUE . "[0]");
        while (defined($columnName)) {
            $self->add($columnName, $columnValue);
            $index++;
            $columnName = $request->getParameter($org::allbinary::logic::control::search::SearchData::COLUMNNAME . "[" . $index . "]");
            $columnValue = $request->getParameter($org::allbinary::logic::control::search::SearchData::COLUMNVALUE . "[" . $index . "]");
        }
    return $self;
}


sub add {
    my ($self, $column, $value) = @_;
        $self->{columnsAndSearchValues}->put($column, $value);
}


sub setOrder {
    my ($self, $value) = @_;
        $self->{order} = $value;
}


sub setSortBy {
    my ($self, $value) = @_;
        $self->{sortBy} = $value;
}


sub setLength {
    my ($self, $value) = @_;
        $self->{listLength} = $value;
}


sub setStartPage {
    my ($self, $value) = @_;
        $self->{startPage} = $value;
}


sub setEndPage {
    my ($self, $value) = @_;
        $self->{endPage} = $value;
}


sub get {
    my ($self) = @_;
        return $self->{columnsAndSearchValues};
}


sub getOrder {
    my ($self) = @_;
        return $self->{order};
}


sub getSortBy {
    my ($self) = @_;
        return $self->{sortBy};
}


sub getLength {
    my ($self) = @_;
        return $self->{listLength};
}


sub getLengthInt {
    my ($self) = @_;
        if (defined($self->{listLength})) {
            return $self->{listLength};
        } else {
            return 0;
        }
}


sub getStartPage {
    my ($self) = @_;
        return $self->{startPage};
}


sub getEndPage {
    my ($self) = @_;
        return $self->{endPage};
}


sub getStartPageInt {
    my ($self) = @_;
        if (defined($self->{startPage})) {
            return $self->{startPage};
        } else {
            return 0;
        }
}


sub getEndPageInt {
    my ($self) = @_;
        if (defined($self->{endPage})) {
            return $self->{endPage};
        } else {
            return 0;
        }
}


# throws Exception
sub getParamsNode {
    my ($self, $document) = @_;
        my $paramsNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::control::search::SearchData::PARAMS, $org::allbinary::logic::control::search::SearchData::PARAMS);
        $paramsNode->appendChild($self->getFieldsNode($document));
        $paramsNode->appendChild($self->getOrderNode($document));
        $paramsNode->appendChild($self->getSortByNode($document));
        $paramsNode->appendChild($self->getLengthNode($document));
        return $paramsNode;
}


# throws Exception
sub getFieldsNode {
    my ($self, $document) = @_;
        my $fieldsNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::control::search::SearchData::FIELDS, $self->{columnsAndSearchValues}->size()->toString());
        my $set = $self->{columnsAndSearchValues}->keySet();
        my $searchValueArray = $set->toArray();
        my $size = scalar(@{$searchValueArray});
        for (my $index = 0; $index < $size; $index++) {
            my $key = $searchValueArray->[$index];
            my $searchValue = $self->{columnsAndSearchValues}->get($key);
            $fieldsNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::control::search::SearchData::FIELD, $key, 'org::allbinary::data::tree::dom::ToDomHelper'->convertNull($searchValue)));
        }
        return $fieldsNode;
}


# throws Exception
sub getOrderNode {
    my ($self, $document) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::control::search::SearchData::ORDER, 'org::allbinary::data::tree::dom::ToDomHelper'->convertNull($self->getOrder()));
}


# throws Exception
sub getSortByNode {
    my ($self, $document) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::control::search::SearchData::SORTBY, 'org::allbinary::data::tree::dom::ToDomHelper'->convertNull($self->getSortBy()));
}


# throws Exception
sub getLengthNode {
    my ($self, $document) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::control::search::SearchData::LENGTH, 'org::allbinary::data::tree::dom::ToDomHelper'->convertNull($self->getLength()));
}

use java::util::HashMap;
# use java::util::Set;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::data::tree::dom::ToDomHelper;
use org::allbinary::logic::StdUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::control::search::SearchData;

1;

