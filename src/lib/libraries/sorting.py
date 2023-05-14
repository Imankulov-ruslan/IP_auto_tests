import dateparser

__all__ = ['is_array_sorted']

def is_array_sorted(array, column_name, sorting_type):
    if sorting_type == 'Ascending' and column_name == 'Flowcell Date':
        check_sorting = is_datetime_array_sorted_asc
    elif sorting_type == 'Ascending':
        check_sorting = is_array_sorted_asc
    elif sorting_type == 'Descending' and column_name == 'Flowcell Date':
        check_sorting = is_datetime_array_sorted_desc
    elif sorting_type == 'Descending':
        check_sorting = is_array_sorted_desc
    return check_sorting(array)

def is_array_sorted_asc(array):
    if sorted(array) == array:
        return True
    return False

def is_array_sorted_desc(array):
    if sorted(array)[::-1] == array:
        return True
    return False

def is_datetime_array_sorted_asc(array):
    return is_array_sorted_asc([dateparser.parse(i).timestamp() for i in array])

def is_datetime_array_sorted_desc(array):
    return is_array_sorted_desc([dateparser.parse(i).timestamp() for i in array])