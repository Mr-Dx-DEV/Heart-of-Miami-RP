Permissions = {
    OPEN_EDITOR = 'rcore_whiteboard.open_editor', --Open in-game editor for whiteboard place
    OPEN_ALL = 'rcore_whiteboard.open_all', --Open all whiteboards even without job or grade
    EDIT_ALL = 'rcore_whiteboard.edit_all', --Edit all whiteboards even without job or grade
    EDIT = 'rcore_whiteboard.edit', --Edit specific board
}

function whiteboardEditAce(boardId)
    return string.format('%s.%s',Permissions.EDIT, boardId)
end