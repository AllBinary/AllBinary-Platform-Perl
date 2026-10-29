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

package tags::generic::user::UserTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{role} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setRole {
    my ($self, $value) = @_;
        $self->{role} = $value;
        $self->getPropertiesHashMap()->put($org::allbinary::business::user::role::UserRoleData::NAME, $self->{role});
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($tags::generic::user::org::allbinary->{globals}->{GLOBALS2}->{EDIT} + $tags::generic::user::org::allbinary->{globals}->{GLOBALS2}->{EDIT}) == 0) {
                    $self->setName("Edit Session Validation User View - i.e. User Profile Edit");
                    $self->setObjectFile("views.generic.user.EditValidationView");
                }
                if ($self->getCommand()->compareTo($tags::generic::user::org::allbinary->{globals}->{GLOBALS2}->{NEW}) == 0) {
                    $self->setName("New User View");
                    $self->setObjectFile("views.generic.user.NewUserView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0) {
                    $self->setName("Add Validation User View");
                    $self->setObjectFile("views.generic.user.AddValidationUserView");
                } elsif ($self->getCommand()->compareTo($tags::generic::user::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
                    $self->setName("Validation User View");
                    $self->setObjectFile("views.generic.user.ViewValidationUserView");
                } elsif ($self->getCommand()->compareTo($tags::generic::user::org::allbinary->{globals}->{GLOBALS2}->{EDIT}) == 0) {
                    $self->setName("Validation User View");
                    $self->setObjectFile("views.generic.user.EditValidationUserView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{UPDATE}) == 0) {
                    $self->setName("Update Validation User View");
                    $self->setObjectFile("views.generic.user.UpdateValidationUserView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0) {
                    $self->setName("Delete Validation User View");
                    $self->setObjectFile("views.generic.user.DeleteValidationUserView");
                } elsif ($self->getCommand()->compareTo($tags::generic::user::org::allbinary->{globals}->{GLOBALS2}->{BACKUP}) == 0) {
                    die ("View not implemented");
                } elsif ($self->getCommand()->compareTo($tags::generic::user::org::allbinary->{globals}->{GLOBALS2}->{RESTORE}) == 0) {
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
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use org::allbinary::business::user::role::UserRoleData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use tags::StoreValidationTransformTag;

1;

