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

package org::allbinary::business::category::store::theme::StoreThemeCategoryPathView;
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
        my $themeArray = $storeThemeCategoryInterface->getThemes()->toArray();
        my $size = scalar(@{$themeArray});
        for (my $i = 0; $i < $size; $i++) {
            my $themeValidation = $themeArray->[$i];
            my $domNodeInterface = 'org::allbinary::logic::visual::theme::ThemePropertiesView'->new($themeValidation);
            $node->appendChild($domNodeInterface->toXmlNode($document));
        }
        return $node;
}

use org::allbinary::business::category::CategoryView;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::visual::theme::ThemeInterface;
use org::allbinary::logic::visual::theme::ThemePropertiesView;
use org::allbinary::logic::visual::theme::ThemeValidation;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

