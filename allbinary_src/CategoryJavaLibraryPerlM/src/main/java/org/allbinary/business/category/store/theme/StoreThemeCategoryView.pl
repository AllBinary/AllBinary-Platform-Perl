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

package org::allbinary::business::category::store::theme::StoreThemeCategoryView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::CategoryView','org::allbinary::data::tree::dom::DomNodeInterface';



sub new {
    my ($class, $categoryInterface) = @_;
    my $self = $class->SUPER::new($categoryInterface);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $self->SUPER::toXmlNode($document);
        my $storeThemeCategoryInterface = $self->getCategoryInterface();
        my $themeValidationArray = $storeThemeCategoryInterface->getThemes()->toArray();
        'java::util::Arrays'->sort($themeValidationArray, 'org::allbinary::business::category::store::theme::ThemeComparator'->new());
        my $size = scalar(@{$themeValidationArray});
        for (my $index = 0; $index < $size; $index++) {
            my $themeValidation = $themeValidationArray->[$index];
            $node->appendChild($themeValidation->toXmlNode($document));
        }
        return $node;
}

# use java::util::Arrays;
use org::allbinary::business::category::CategoryView;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::visual::theme::ThemeValidation;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::category::store::theme::ThemeComparator;

1;

