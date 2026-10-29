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

package tags::admin::storefront::StoreFrontTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0) {
                    $self->setName("Add Validation StoreFront View");
                    $self->setObjectFile("views.admin.storefront.AddValidationStoreFrontView");
                } elsif ($self->getCommand()->compareTo($tags::admin::storefront::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
                    die ("View not implemented");
                } elsif ($self->getCommand()->compareTo($tags::admin::storefront::org::allbinary->{globals}->{GLOBALS2}->{EDIT}) == 0) {
                    $self->setName("Edit Validation StoreFront View");
                    $self->setObjectFile("views.admin.storefront.EditValidationStoreFrontView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{UPDATE}) == 0) {
                    $self->setName("Update Validation StoreFront View");
                    $self->setObjectFile("views.admin.storefront.UpdateValidationStoreFrontView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0) {
                    $self->setName("Delete Validation StoreFront View");
                    $self->setObjectFile("views.admin.storefront.DeleteValidationStoreFrontView");
                } elsif ($self->getCommand()->compareTo($tags::admin::storefront::org::allbinary->{globals}->{GLOBALS2}->{BACKUP}) == 0) {
                    die ("View not implemented");
                } elsif ($self->getCommand()->compareTo($tags::admin::storefront::org::allbinary->{globals}->{GLOBALS2}->{RESTORE}) == 0) {
                    die ("View not implemented");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DROP}) == 0) {
                    die ("View not implemented");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{CREATE}) == 0) {
                    die ("View not implemented");
                } else {
                    die ("No Such View Command: " . $self->getCommand());
                }
                return $self->SUPER::doStartTag();
            }
            die ("Command Null");
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::StoreValidationTransformTag;

1;

