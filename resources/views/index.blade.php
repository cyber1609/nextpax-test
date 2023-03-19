<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>nextpax Test App</title>
    <style>
        table, th, td {
            border: 1px solid black;
            padding: 5px;
        }
    </style>
</head>
<body>
<table class="table-fixed border">
    <thead>
    <tr>
        <th class="border">Date/Nights</th>
        <th class="border">Number of Persons</th>
        @for($day = 1; $day <= 21; $day++)
            <th class="border">{{ $day }}</th>
        @endfor
    </tr>
    </thead>
    <tbody>
    @foreach($data as $date => $dateData)
        @foreach($dateData as $persons => $personData)
            <tr>
                <td class="border">{{$date}}</td>
                <td class="border">{{$persons}}</td>
                @for($day = 1; $day <= 21; $day++)
                    <td class="border">{{isset($personData[$day]) ?  number_format(min($personData[$day])/100, 2, '.', ' ') : '0.00'}}</td>
                @endfor
            </tr>
        @endforeach

    @endforeach
    </tbody>
</table>
</body>
</html>
