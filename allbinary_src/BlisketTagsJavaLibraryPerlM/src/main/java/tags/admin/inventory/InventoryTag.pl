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

package tags::admin::inventory::InventoryTag;
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
                if ($self->getCommand()->compareTo($tags::admin::inventory::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
                    die ("No Such View Command: " . $self->getCommand());
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0) {
                    $self->setName("Add Inventory Item Validation View");
                    $self->setObjectFile("views.admin.inventory.AddFileValidationView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0) {
                    $self->setName("Delete Inventory Item Validation View");
                    $self->setObjectFile("views.admin.inventory.DeleteFileValidationView");
                } elsif ($self->getCommand()->compareTo($tags::admin::inventory::org::allbinary->{globals}->{GLOBALS2}->{EDIT}) == 0) {
                    $self->setName("Edit Inventory Item Validation View");
                    $self->setObjectFile("views.admin.inventory.EditValidationView");
                } elsif ($self->getCommand()->compareTo($tags::admin::inventory::org::allbinary->{globals}->{GLOBALS2}->{NEW}) == 0) {
                    $self->setName("New Inventory Item Validation View");
                    $self->setObjectFile("views.admin.inventory.NewValidationView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{UPDATE}) == 0) {
                    $self->setName("Update Inventory Item Validation View");
                    $self->setObjectFile("views.admin.inventory.UpdateFileValidationView");
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

