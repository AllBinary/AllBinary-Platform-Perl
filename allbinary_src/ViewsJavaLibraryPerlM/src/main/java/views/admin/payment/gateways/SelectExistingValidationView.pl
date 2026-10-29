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

package views::admin::payment::gateways::SelectExistingValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::logic::control::validate::ValidationComponentInterface';



sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
        # super(...) made $self above
    return $self;
}


sub isValid {
    my ($self) = @_;
        return 1;
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        die ("validationInfo");
}


sub toXmlDoc {
    my ($self) = @_;
        return undef;
}


sub toXmlNode {
    my ($self, $document) = @_;
        return undef;
}


# throws Exception
sub view {
    my ($self) = @_;
        return 'views::admin::payment::gateways::SelectExistingView'->new($self->getTransformInfoInterface())->view();
}

use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;
use views::admin::payment::gateways::SelectExistingView;

1;

