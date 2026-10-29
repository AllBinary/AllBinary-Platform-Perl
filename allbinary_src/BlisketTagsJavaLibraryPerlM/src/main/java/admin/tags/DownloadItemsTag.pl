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

package admin::tags::DownloadItemsTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        $self->setTagHelperFactory('admin::taghelpers::DownloadItemsHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::DownloadItemsRequestHelperFactory'->new());
    return $self;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($self->isEnabled()) {
                if (defined($self->getCommand())) {
                    if ($self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{BACKUP}) != 0 && $self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{RESTORE}) != 0 && $self->getCommand()->compareTo($self->{commonStrings}->{CREATE}) != 0 && $self->getCommand()->compareTo($self->{commonStrings}->{DROP}) != 0) {
                        my $parentTag = $self->getParent();
                        'admin::tags::ParentInventoryTagHelper'->getInstance()->isValid($self, $parentTag);
                        $self->getPropertiesHashMap()->put($admin::tags::AbTagData::PARENT, $parentTag);
                    }
                    return $self->SUPER::doStartTag();
                }
            }
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
# use javax::servlet::jsp::tagext::Tag;
use admin::taghelpers::DownloadItemsHelperFactory;
use admin::taghelpers::DownloadItemsRequestHelperFactory;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use admin::tags::TableTag;
use admin::tags::ParentInventoryTagHelper;
use admin::tags::AbTagData;

1;

